## ⚡ Quickstart

```bash
# Environment setup
conda create -n unlearning python=3.11
conda activate unlearning
pip install .[lm_eval]
pip install --no-build-isolation flash-attn==2.6.3

# Data setup
python setup_data.py --eval  # saves/eval now contains evaluation results of the uploaded models
# This downloads log files with evaluation results (including retain model logs)
# into `saves/eval`, used for evaluating unlearning across supported benchmarks.
# Additional datasets (e.g., WMDP) are supported — run below for options:
# python setup_data.py --help
```

---


## 🧠 UNLamb Unlearning

### Scripts

#### 🔧 For Fine-Tuning:

```bash
bash unlamb-unlearning/scripts/unlamb_finetune.sh
```

#### 🔥 For Unlearning:

```bash
bash unlamb-unlearning/scripts/unlamb_unlearn.sh
```

#### 📊 For Unlearning Metrics Evaluation:

```bash
bash unlamb-unlearning/scripts/unlamb_unlearn_eval.sh
```

#### 🧪 For LLM Benchmark Evaluation:

```bash
bash unlamb-unlearning/scripts/unlamb_mmlu_eval.sh
```

---

## 📊 Performing an Evaluation

Below is an example command to launch a UNLamb evaluation process on the `rare_forget10` (or `popular_forget10`) split:

```bash
model=Llama-3.2-1B-Instruct
python src/eval.py --config-name=eval.yaml experiment=eval/unlamb/default \
  model=${model} \
  model.model_args.pretrained_model_name_or_path=unlamb-unlearning/saves/ft/unlamb_${model}_full \
  retain_logs_path=saves/eval/unlamb_${model}_retain_intersection90/UNLAMB_EVAL.json \
  task_name=SAMPLE_EVAL
```

---

## 🧑‍🔬 Running Baseline Experiments

The following scripts execute standard baseline unlearning experiments on the UNLamb dataset and evaluate them using the corresponding benchmarks. The expected results for these experiments are detailed in [`docs/repro.md`](docs/repro.md).

```bash
bash scripts/unlamb_unlearn.sh
bash scripts/unlamb_muse_unlearn.sh
```

---

## 🤝 Acknowledgements

* This repository is an extension of the [Open-Unlearning](https://github.com/locuslab/open-unlearning) repository.

---

## 📄 License

This project is licensed under the MIT License. See the [`LICENSE`](LICENSE) file for details.

---
