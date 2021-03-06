#!/bin/sh
alat="$(seq 8.88787683517 0.05 9.29745186)"

for a in $alat
do
cat > Pb.relax.in <<EOF    
  &CONTROL
                       title = 'Lead' ,
                  calculation = 'vc-relax',
                restart_mode = 'from_scratch' ,
                      outdir = '/home/elena/AEP_DFT/DFT/tmp/bands' ,
                  pseudo_dir = '/home/elena/qe-6.7/pseudo/' ,
                      prefix = 'Pb',
                      wf_collect = .true.
/
 &SYSTEM
                       ibrav = 2,
                   celldm(1) = $a,
                         nat = 1,
                        ntyp = 1,
                     ecutwfc = 70 ,
                     ecutrho = 560 ,
                 occupations = 'smearing' ,
                     degauss = 0.02 ,
                    smearing = 'mp' ,
/
&ELECTRONS
 conv_thr =   1.0d-9
/
&IONS
/
&CELL
 /
ATOMIC_SPECIES
   Pb  207.20000  Pb.pbe-dn-rrkjus_psl.1.0.0.UPF 
ATOMIC_POSITIONS crystal 
   Pb      0.000000000    0.000000000    0.000000000    
K_POINTS automatic 
  10 10 10   0 0 0 
EOF

 ~/qe-6.7/bin/pw.x < ./Pb.relax.in > Pb_${a}.relax.out
rm -rf tmp
done
