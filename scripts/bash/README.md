
## [Comprimir los pdf de una carpeta](./compress_many_pdf.sh)

~~~bash
./compress_many_pdf.sh ~/Documentos
~~~

Esto buscara y comprimira todos los pdf dentro de la carpeta `Documentos`, los archivos comprimidos se guardaran en la carpeta `compress`, y los originales en la carpeta `originals`

## PDF A IMAGEN
### A PNG

~~~bash
gs -dSAFER -dBATCH -dNOPAUSE -sDEVICE=pngalpha -r300 -sOutputFile=salida-%03d.png entrada.pdf
~~~

### A JPG
~~~bash
gs -dSAFER -dBATCH -dNOPAUSE -sDEVICE=jpeg -r300 -dJPEGQ=90 -sOutputFile=salida-%03d.jpg entrada.pdf
~~~

## UNIR PDF
~~~bash
gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=salida.pdf archivo1.pdf archivo2.pdf
~~~
