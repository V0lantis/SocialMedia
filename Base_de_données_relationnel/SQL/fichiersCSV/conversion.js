let csvToJson = require('convert-csv-to-json');

let fileInputName = 'personne_data.csv'; 
let fileOutputName = 'personne_data.json';

csvToJson.generateJsonFileFromCsv(fileInputName,fileOutputName);
csvToJson.fieldDelimiter(',') .getJsonFromCsv(fileInputName);
/* https://github.com/iuccio/csvToJson */