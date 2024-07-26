// funny little script
var interval = -1
var golden = -1

function auto() {
    interval = setInterval(() => {
        Game.Win("Uncanny clicker") // whelp
        Game.lastClick -= 1000
        document.getElementById("bigCookie").click()
    }, 17)
}

function gold() {
    golden = setInterval(() => {
        var t = Game.shimmers[0]
        var type = t.type
        if (type === "golden" || type === "reindeer") {
            t.pop()
        }
    }, 125) // yeah thanks Uncanny Clicker for ruining so many people's saves; this works fine
}
onkeydown = e => {
    if (e.key === "1") {
        if (interval === -1) {
            auto()
        } else {
            clearInterval(interval)
            interval = -1
        }
    } else if (e.key === "2") {
        if (golden === -1) {
            gold()
        } else {
            clearInterval(golden)
            golden = -1
        }
    }
}