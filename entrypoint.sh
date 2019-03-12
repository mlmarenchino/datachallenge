papermill src/data_challenge.ipynb results/output.ipynb #-p input_path $1 -p output_path $2
#cat /tmp/evaluation_measure.txt
jupyter nbconvert results/output.ipynb --to pdf