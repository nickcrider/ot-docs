from opentrons import __version__ as build
from opentrons.protocol_api import MAX_SUPPORTED_VERSION as api_level

version_dir = 'version_info/'

build = str(build)
api_level = str(api_level)


with open( version_dir + 'build.txt', 'w' ) as f:
    f.write(str(build))


with open( version_dir + 'apilevel.txt', 'w' ) as f:
    f.write(str(api_level))

print(f'Versions updated! Build: {build} API Level: {api_level}')