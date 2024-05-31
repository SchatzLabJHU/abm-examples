# Sample configurations for using ABM

[Automated Benchmarking](https://github.com/galaxyproject/gxabm), or ABM, is a command-line tool that automates and tracks the benchmarking process for workflows in Galaxy.

In this repository you will find complete examples on how to use ABM.

# One-time ABM setup

If you do not have ABM installed already, start by installing and configuring
it. You can also find these instructions in the [ABM
documentation](https://github.com/galaxyproject/gxabm).

1. Install ABM
```bash
python3 -m venv .venv
source .venv/bin/activate
pip install gxabm
```

2. Obtain your API keys from the Galaxy servers and add them to the
   `~/.abm/profile.yml` file. Here is a sample profile file for usegalaxy.org
   and usegalaxy.org.au.
```
usa:
  url: https://usegalaxy.org
  key: your_Galaxy_US_api_key
australia:
  url: https://usegalaxy.org.au
  key: your_Galaxy_AU_api_key
```

3. Clone this repository and copy Workflow and History configurations to
   `~/.abm`. Those two files contain links to the relevant workflows and inputs
   for the workloads we'll benchmark.
```bash
git clone https://github.com/ksuderman/abm-paper-examples.git
cd abm-paper-examples
cp .abm/histories.yml .abm/workflows.yml ~/.abm/
```

# Run benchmarks

With the necessary configurations done, let's run a performance comparison
experiment. An ABM Experiment defines which benchmarks we want to run, on which
Galaxy servers, and how many times. You can find the Experiment definition in
the `experiments` folder. For the `vc` (Variant Calling) experiment, ABM will
import a variant calling workflow to the Galaxy servers defined above, upload
some sample data, and invoke the workflow. It will then monitor the workflow as
it runs and, once complete, download the runtime data for each tool. The
`summarize` sub-command will consolidate and present the results. The data can
also be downloaded in a CSV format for downstream analysis in other tools.

1. Upload the workflow and history to the Galaxy server
```bash
for server in usa australia; do
    abm $server workflow import variant
    abm $server history import variant-2g
done
```

2. Run the experiment
```bash
abm experiment run experiments/vc.yml
```

3. Wait for the `run experiment` command to finish.  This will take a while.

4. View a summary of the results
```bash
abm experiment summarize metrics/experiment name
```


## Changing experiment configuration

If you would like to change this workflow or input data is used for the
benchmarks, simply edit the `~/.abm/workflows.yml` and `~/.abm/histories.yml`
files from above to point to your desired workflow. You will also need to change
the contents of `benchmarks/vc.yml` to update the name of the workflow and its
inputs.
