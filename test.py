
import re

import os
package = 'Orange_Vision'


init_path = os.path.join(os.path.dirname(__file__),
                         package,
                         '__init__.py')
with open(init_path) as f:
    contents = f.read()
__version__ = re.search(r"__version__ = '([.\d]+)'", contents).group(1)
print(__version__)