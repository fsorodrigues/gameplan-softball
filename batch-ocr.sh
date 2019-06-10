mkdir -p ./ocr-pdfs

for file in ./raw-pdfs/*
do
    pathIn="$(basename $file)"
    pathOut="$(echo $pathIn | tr '\n' ' ' | sed -e 's/[[:space:]]*$//')"
    basepath="./ocr-pdfs"
    outputFile="$basepath/$pathOut"
    echo $outputFile
    ocrmypdf --output-type pdfa "$file" "$outputFile" --force-ocr
done
