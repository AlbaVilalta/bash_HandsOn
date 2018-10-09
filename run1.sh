## Author: Alba Vilalta
## Date: 18/09/2018
## Bash Hands-On

#TASK 1
pwd #comprovo on sóc: /home/usuario
mkdir bash_HandsOn #creo la carpeta bash_HandsOn
ls #comprovo que la carpeta s'ha creat
cd bash_HandsOn #vaig a la carpeta
mkdir bin #creo la carpeta bin dins de bash_HandsOn
mkdir input #creo la carpeta input dins de bash_HandsOn
mkdir output #creo la carpeta output dins de bash_HandsOn
mkdir logs #creo la carpeta logs dins de bash_HandsOn
mkdir trash #creo la carpeta trash dins de bash_HandsOn
# es poden crear totes alhora tambe
ls #comprovo que tots els subdirectoris s'han creat
ls -l #per veure les característiques de la carpeta
cp -r trash trash2 #copio trash al nou directori trash2
mv trash trash1 #canvio el nom de trash a trash1
ls #comprovo que hi ha trash1 i trash2
rmdir trash2 #elimino el directori trash2

#TASK 2
wget https://raw.githubusercontent.com/dgarrimar/teaching/master/uvic/AdvBI_2018/data/hands-on/bash/sample-groups.tsv #em descarrego l'arxiu
ls #comprovo que s'ha descarregat correctament l'arxiu sample-groups.tsv
mv sample-groups.tsv input/input.tsv #canvio el nom de l'arxiu i el moc a la carpeta input
ls input #cromprovo que s'ha copiat correctament
ln -s input.tsv trash1/input_symlink #creo un link simbolic de input.tsv a trash1 anomenat input_symlink
ls trash1 #comprovo que el link simbolic s'ha realitzat correctament
cp -r input/input.tsv trash1/input_copy #copio input.tsv a trash1 amb el nom input_copy
ls trash1 #comprovo que s'ha copiat
touch trash1/IAmLearningSomeBash #creo l'arxiu nou a trash1
ls trash1 #comprovo que s'ha creat correctament
rm -rf trash1 #elimino la carpeta trash1
ls #comprovo que trash1 s'ha borrat

#TASK 3
mkdir output/task_3 #creo el directori task_3 a la carpeta output
ls output #comprovo que s'ha creat
head -n100 input/input.tsv > output/task_3/top100.tsv #copio les 100 primeres linies de input.tsv a un nou arxiu anomenat top100 a la carpeta task_3 de output
ls output/task_3 #comprovo que s'ha creat
tail -n50 input/input.tsv > output/task_3/last50.tsv #copio les 50 ultimes linies de input.tsv a un nou arxiu anomenat last50 a la carpeta task_3 de output
wc -l output/task_3/top100.tsv #numero de linies de l'arxiu top100.tsv
wc -l output/task_3/last50.tsv #numero de linies de l'arxiu last.tsv
cat output/task_3/top100.tsv output/task_3/last50.tsv > output/task_3/150together.tsv #fusionem top100 i last50 en un sol arxiu anomenat 150together a la carpeta task_3
head output/task_3/150together.tsv #comprovem que s'ha creat
paste <(cut -f1 output/task_3/150together.tsv) <(cut -f1 output/task_3/150together.tsv) > output/task_3/150firstcX2.tsv #unim dues copies de la priemra columna de l'arxiu 150together.tsv en un nou arxiu anomenat 150firstcX2.tsv
head output/task_3/150firstcX2.tsv # comprovem que s'ha creat

#TASK 4
mkdir output/task_4 #creo task_4 a la carpeta output
ls output #comprovo que s'ha creat
cut -f2 input/input.tsv | sort -r | grep -v "Adipose" | grep -v "Artery" | uniq -d >output/task_4/unique.tissues2.txt #tallo la segona columna de l'arxiu input, l'ordeno al reves, elimino les linies que contenen Adipose i Artery i ho guardo en un nou arxiu anomenat unique.tissues2.txt
ls output/task_4 #cromprovo que s'ha creat
cut -f3 input/input.tsv | sort -r | grep -v "Adipose" | grep -v "Artery" | uniq -d > output/task_4/unique.tissues3.txt #tallo la tercera columna de l'arxiu input, l'ordeno al reves, elimino les linies que contenen Adipose i Artery i ho guardo en un nou arxiu anomenat unique.tissues3.txt
ls output/task_4 #comprovo que s'ha creat
diff output/task_4/unique.tissues2.txt output/task_4/unique.tissues3.txt > output/task_4/differences #comparo els dos fitxes per veure quines diferencies tenen i guardo el resultat en un nou fitxes anomenat differences
less output/task_4/differences #observo les diferencies entre els dos arxius
q #per sortir de less

#TASK 5
wget https://github.com/dgarrimar/teaching/raw/master/uvic/AdvBI_2018/data/hands-on/bash/scripts.tar.gz #em descarrego l'arxiu
ls #comprovo que s'ha baixat correctament
gunzip scripts.tar.gz #descomprimir l'arxiu
ls #comprovo que s'ha descomprimit
tar -xf scripts.tar #desempaqueto la carpeta
ls #comprovo que s'ha desempaquetat
mv usage.sh bin #moc usage.sh a la carpeta bin
ls bin #comprovo que s'ha mogut
less bin/usage.sh #veure l'arxiu sense poder-lo modificar
q #per sortir de l'arxiu
nano bin/usage.sh #obro l'arxiu per modificar-lo. Poso les variables al echo i provo que funcioni
PATH="$PATH:/Home/bash_HandsOn/bin"
chmod +x bin/usage.sh #donc permis d'execusió de usage.sh
bash bin/usage.sh #executo el programa

#TASK 6
wget https://github.com/dgarrimar/teaching/raw/master/uvic/AdvBI_2018/data/hands-on/bash/unknown.samples.tsv #em descarrego el fitxes
ls #comprovo que s'ha descarregat
sort -k1,1 unknown.samples.tsv > unknown1.tsv #primer ordenem la columna 1
mv unknown1.tsv unknown.samples.tsv #torno a canviar el nom
join -t $'\t' -1 1 -2 1 input/input.tsv unknown.samples.tsv > joint.tsv #uneixo la primera columna de cada arxiu en un nou arxiu anomenat joint.tsv
ls #comprovo que s'ha creat
awk '{print$4,$3,$2,$1}' joint.tsv | sed 's/_/ /g' > joint2.tsv #canvio _ per espais, ordeno l'arxiu al revés i el guardo a joint.tsv
mv joint2.tsv joint.tsv
less joint.tsv

#TASK 7
bash bin/usage.sh #executo

#EXERCISE 1
mkdir exercises #creo el directori exercise
cd exercises #em moc cap al directori exercises
touch exercise1.sh #creo un nou script


