
import getopt
from lxml import etree
import os
import sys
import webbrowser


def help():
    print("Please supply a scenario filename, e.g. FirstBullRun.xml, with a -f in front:")
    print('  python battlecry.py -f <scenario_file> -d <display_file>')
    print('     OR ')
    print("Supply a scenario directory, e.g. /home/derek/Desktop, with a -s in front:")
    print('  python battlecry.py -s <scenario_directory>')    
    print('Optionally add -y, followed by name of style (color is the default)')
    print('  Styles can be: color, bw, or terrain')


def main(argv):
    inputfile = None
    outputfile = None
    directory = None
    style = 'color'
    try:
        opts, args = getopt.getopt(
            argv,
            "hf:d:s:y:",
            ["scenario=", "display=", "dir=", "style="])
    except getopt.GetoptError:
        help()
        sys.exit(2)
    if len(opts) == 0:
        help()
        sys.exit(2)
    for opt, arg in opts:
        if opt == '-h':
            help()
            sys.exit()
        elif opt in ("-f", "--scenario"):
            inputfile = arg
        elif opt in ("-d", "--display"):
            outputfile = arg
        elif opt in ("-s", "--dir"):
            directory = arg
        elif opt in ("-y", "--style"):
            style = arg
    print('Scenario file is:', inputfile)
    if not outputfile:
        basename = inputfile.rsplit('.', 1)[0]
        outputfile = '{}.svg'.format(basename)
    if style and style in ['color', 'bw', 'terrain']:
        the_style = style
    print('Display file is:', outputfile)
    print('Styling is:', the_style)

    # TODO - process directory - os.path.isdir(path)

    dom = etree.parse("BattleCry/scenarios/{}".format(inputfile))
    if the_style == 'bw':
        xslt = etree.parse("BattleCry/styles/battle2bwSVG.xsl")
    elif the_style == 'terrain':
        xslt = etree.parse("BattleCry/styles/battle2colorTerrain.xsl")
    else:
        xslt = etree.parse("BattleCry/styles/battle2colorSVG.xsl")
    transform = etree.XSLT(xslt)
    result = transform(dom)

    cwd = os.getcwd()
    _path = os.path.join(cwd, 'BattleCry')
    outputfilepath = os.path.join(_path, outputfile)
    with open(outputfilepath, 'w') as f:
        f.write(str(result))

    url = 'file:///' + outputfilepath
    webbrowser.open(url)


if __name__ == "__main__":
   main(sys.argv[1:])

