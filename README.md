# Sample configurations

These are the examples used in the ABM paper. This is a work in progress and will be updated once the paper is accepted.

## Instructions

1. Clone this repository
```bash
git clone https://github.com/ksuderman/abm-paper-examples.git
cd abm-paper-examples
```
2. Install ABM
```bash
python3 -m venv .venv
source .venv/bin/activate
pip install gxabm
```
3. Copy the `.abm` directory to your $HOME directory.  If you have already installed ABM, just copy the contents of the files to the corresponding files in your $HOME/.abm directory.
4. Obtaion API keys from the Galaxy servers and add them to the `~/.abm/profile.yml` file.
5. Run the experiment
```bash
abm experiment run experiments/vc.yml
```
6. Wait for the experiment to finish.  This will take a while.
7. View the results
```bash
abm experiment summarize metrics/experiment name
```

