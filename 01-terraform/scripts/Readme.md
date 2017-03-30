Terraform Scripts usage

In this folder we have the following scripts.

─── 0-configure-global.sh           # <-- This script must be run before building or destroying the enviroments.
├── 1-apply-global.sh.              # <-- This is used to build the Dev, Perf and Test enviroments
├── 2-new-stack.sh.                 # <-- This is used to create a new Application stack in an specified enviroments.
├── 99-destroy-global.sh            # <-- This destroys all the component for an enviroments.


