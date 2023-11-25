# A Dev Env for gem5

## Usage

1. `git clone` this project

2. Generate `./config/gem5_import.py`:

   ```bash
   python ./config/gen_gem5/import.py
   ```

3. Build `gem5.opt`:

    ```bash
    cd ./gem5
    scons build/X86/gem5.opt -j 10
    ```

    If you wish to get a newer `SCons`:

    ```bash
    python -m venv .venv && source .venv/bin/activate
    pip install scons
    alias scons=".venv/bin/scons"
    ```

4. Create your config scripts

5. Setup your gem5 config by editing `./scripts/exec.sh`:

    ```bash
    #!/bin/bash
    # * setup gem5 config
    readonly TOP="./gem5"
    readonly ISA=X86
    readonly BIN=opt
    ```

6. Execute:

    ```bash
    ./scripts/exec.sh <your-main-config-script> <parameters>
    ```