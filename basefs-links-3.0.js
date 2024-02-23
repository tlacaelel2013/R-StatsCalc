const fs = require('fs')
var http = require('http')

var util = require('util');
var log_file = fs.createWriteStream('./output/basefs-links.sh', {flags : 'w'});
var log_stdout = process.stdout;

console.log = function(d) { //
  log_file.write(util.format(d) + '\n');
  log_stdout.write(util.format(d) + '\n');
};

var download = function(url, dest, cb) {
    var file = fs.createWriteStream(dest)
    var request = http.get(url, function(response) {
        response.pipe(file)
        file.on('finish', function() {
            file.close(cb)
        })
    })
}

var file = JSON.parse(fs.readFileSync("./input/basefs.json"))



var files = []
function recurse(children, cd) {
    for (var i = 0; i < children.length; i ++) {
        files.push({ name: cd + "/" + children[i].name, mode: children[i].mode})


        if (typeof children[i].path != "undefined") {
		if (children[i].path.charAt(0) == "/") {
            console.log("ln -s " + children[i].path + " " + cd + "/" + children[i].name )
		} else {
	    console.log("ln -s " + cd + "/" + children[i].path + " " + cd + "/" + children[i].name )
		}
        }

        if (typeof children[i].src != "undefined") {
                if (children[i].src.charAt(0) == "/") {
            console.log("cp -r " + children[i].src + " " + cd + "/" + children[i].name )
                } else {
            console.log("cp -r " + "/" + children[i].src + " " + cd + "/" + children[i].name )
                }
        }

	if (typeof children[i].mode != "undefined") {
                if (children[i].mode.charAt(0) == "1") {
            console.log("chmod " + children[i].mode.charAt(3) + children[i].mode.charAt(4) + children[i].mode.charAt(5) + " " + cd + "/" + children[i].name )
                } else {
            console.log("chmod " + children[i].mode.charAt(2) + children[i].mode.charAt(3) + children[i].mode.charAt(4) + " " + cd + "/" + children[i].name )
                }
        }

        if (typeof children[i].uid != "undefined") {
                console.log("chown -v user:user " + cd + "/" + children[i].name )
        }
	else {
		console.log("chown -v root:root " + cd + "/" + children[i].name )
	}




	if (typeof children[i].path != "undefined") {
            files.push({ name: "/" + children[i].path, mode: "1"} )
        }

	if (typeof children[i].c != "undefined") {
            files.push({ name: cd + "/" + children[i].name + ".bz2", mode: "1"} )
        }
        if (typeof children[i].src != "undefined") {
            files.push({ name: "/" + children[i].src, mode: "1"} )
        }
        if (typeof children[i].c != "undefined" && typeof children[i].src != "undefined") {
            files.push({ name: "/" + children[i].src + ".bz2", mode: "1"} )
        }
        //files
        if (typeof children[i].child == "object") {
            recurse(children[i].child, cd + "/" + children[i].name)
        }
    //    recurse(children[i].child)
    }
}
recurse(file.fs, "")


// console.log(files)

var cnt = 0
var block = false
var interval = setInterval(function() {
    if (block) {
        return
    }
    if (cnt == files.length) {
        clearInterval(interval)
        console.log("echo 'Finished Part 1 !!'")
        return
    }

    var file = "./fs" + files[cnt].name
    block = true

  //  console.log("(" + (cnt + 1) + "/" + files.length + ") " + file)

    if (fs.existsSync(file)) {
  //      console.log("allready exists "+file)
        cnt ++
        block = false
    } else {
        if (files[cnt].mode.charAt(0) == "4") {
   //         console.log("Made dir " + file)
            fs.mkdirSync(file)
            cnt ++
            block = false
        } else {
//            download("http://s-macke.github.io/jor1k/openrisc-sys/fs" + files[cnt].name, file, function(f) {
     //           console.log("downloaded "+file)
                cnt ++
                block = false
 //           })
        }
    }
}, 0)
