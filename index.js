const Parser = require('sql-ddl-to-json-schema');

const { join } = require('path');
const { readFileSync } = require('fs');
const { writeFileSync } = require('fs');
const parser = new Parser('mysql');
const options = {};

let sql = readFileSync(join(__dirname, 'example', 'animal.sql')).toString();
sql = sql.replace( new RegExp("\\/\\*!.*[\\s\\S]|^.*--.*","gm"),"");

parser.feed(sql)
  .toJsonSchemaFiles(join(__dirname, 'example'), { extension: '.schema.json', indent: 4, useRef: false })
  .then(outputFilePaths => {
    console.log(JSON.stringify(outputFilePaths, null, 2));
  });
