cp gpe_params.py dependencies
cd dependencies
python write_gpe_params_file.py
matlab -nodisplay < groundstate1d.m > /dev/null 2>&1
python plotter.py
cd ..
cp dependencies/phi.csv .
