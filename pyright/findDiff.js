var fs = require('fs/promises') 
 
var tr = require('./package.nls.tr.json')
var en = require('./package.nls.en-us.json')
var diffs = []
compareAllKeysFromJson = function(outdated, updated) {
    for (const el of Object.keys(updated)) {
        if (!outdated[el]) {
            diffs.push(el)
            outdated[el] = updated[el]
        } else if (typeof updated[el] == 'object')
            compareAllKeysFromJson(outdated[el], updated[el])
    }

    for (const el of Object.keys(outdated)) {
         if (!updated[el] && outdated[el])
        delete outdated[el] 
    }
}

compareAllKeysFromJson(tr, en)

var obj = JSON.stringify(tr, null, 4) 
fs.writeFile("package.nls.tr-updated.json", obj)
    .catch(err => {
        console.error(err) 
    })

console.log("\n===========================================") 
console.log("DEĞİŞTİRİLEN VE ÇEVİRLMESİ GEREKEN KEYLER") 
console.log("===========================================\n") 
 
for (const el of diffs) {
    console.log(el);
}