#!/bin/bash
set -e

bash /mnt/extremessd10tb/borisiuk/open-unlearning/scripts/unlamb_finetune.sh
bash /mnt/extremessd10tb/borisiuk/open-unlearning/scripts/unlamb_unlearn1.sh
bash /mnt/extremessd10tb/borisiuk/open-unlearning/scripts/unlamb_unlearn_eval1.sh