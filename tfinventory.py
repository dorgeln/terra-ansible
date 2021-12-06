#!/usr/bin/env python

import os
import json
from ansible.plugins.inventory import BaseInventoryPlugin
from ansible.errors import AnsibleError, AnsibleParserError

if __name__ == '__main__':
    inventory={}

    tfstate_cmd = os.popen('cd tf;terraform state pull')
    tfstate = json.loads(tfstate_cmd.read())
    print(tfstate)
