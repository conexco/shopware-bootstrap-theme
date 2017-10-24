/* Canvas animation */

var canvas = document.getElementById("canvas"),
    ctx = canvas.getContext("2d"),
    cw = canvas.width = window.innerWidth,
    cx = cw / 2,
    ch = canvas.height = window.innerHeight,
    cy = ch / 2;

ctx.fillStyle = "#efefef";
var linesNum = 8;
var linesRy = [];
var requestId = null;

function Line(flag) {
    this.flag = flag;
    this.a = {};
    this.b = {};
    if (flag == "v") {
        this.a.y = 0;
        this.b.y = ch;
        this.a.x = randomIntFromInterval(0, ch);
        this.b.x = randomIntFromInterval(0, ch);
    } else if (flag == "h") {
        this.a.x = 0;
        this.b.x = cw;
        this.a.y = randomIntFromInterval(0, cw);
        this.b.y = randomIntFromInterval(0, cw);
    }
    this.va = randomIntFromInterval(25, 100) / 100;
    this.vb = randomIntFromInterval(25, 100) / 100;

    this.draw = function() {
        ctx.strokeStyle = "#efefef";
        ctx.beginPath();
        ctx.moveTo(this.a.x, this.a.y);
        ctx.lineTo(this.b.x, this.b.y);
        ctx.stroke();
    }

    this.update = function() {
        if (this.flag == "v") {
            this.a.x += this.va;
            this.b.x += this.vb;
        } else if (flag == "h") {
            this.a.y += this.va;
            this.b.y += this.vb;
        }
        this.edges();
    }

    this.edges = function() {
        if (this.flag == "v") {
            if (this.a.x < 0 || this.a.x > cw) {
                this.va *= -1;
            }
            if (this.b.x < 0 || this.b.x > cw) {
                this.vb *= -1;
            }
        } else if (this.flag == "h") {
            if (this.a.y < 0 || this.a.y > ch) {
                this.va *= -1;
            }
            if (this.b.y < 0 || this.b.y > ch) {
                this.vb *= -1;
            }
        }
    }
}

for (var i = 0; i < linesNum; i++) {
    var flag = i % 2 == 0 ? "h" : "v";
    var l = new Line(flag);
    linesRy.push(l);
}

function Draw() {
    requestId = window.requestAnimationFrame(Draw);
    ctx.clearRect(0, 0, cw, ch);

    for (var i = 0; i < linesRy.length; i++) {
        var l = linesRy[i];
        l.draw();
        l.update();
    }
    for (var i = 0; i < linesRy.length; i++) {
        var l = linesRy[i];
        for (var j = i + 1; j < linesRy.length; j++) {
            var l1 = linesRy[j]
            Intersect2lines(l, l1);
        }
    }
}

function Init() {
    linesRy.length = 0;
    for (var i = 0; i < linesNum; i++) {
        var flag = i % 2 == 0 ? "h" : "v";
        var l = new Line(flag);
        linesRy.push(l);
    }

    if (requestId) {
        window.cancelAnimationFrame(requestId);
        requestId = null;
    }

    cw = canvas.width = window.innerWidth,
    cx = cw / 2;
    ch = canvas.height = window.innerHeight,
    cy = ch / 2;

    Draw();
};

setTimeout(function() {
    Init();
    addEventListener('resize', Init, false);
}, 15);

function Intersect2lines(l1, l2) {
    var p1 = l1.a,
        p2 = l1.b,
        p3 = l2.a,
        p4 = l2.b;
    var denominator = (p4.y - p3.y) * (p2.x - p1.x) - (p4.x - p3.x) * (p2.y - p1.y);
    var ua = ((p4.x - p3.x) * (p1.y - p3.y) - (p4.y - p3.y) * (p1.x - p3.x)) / denominator;
    var ub = ((p2.x - p1.x) * (p1.y - p3.y) - (p2.y - p1.y) * (p1.x - p3.x)) / denominator;
    var x = p1.x + ua * (p2.x - p1.x);
    var y = p1.y + ua * (p2.y - p1.y);
    if (ua > 0 && ub > 0) {
        markPoint({
            x: x,
            y: y
        })
    }
}

function markPoint(p) {
    ctx.beginPath();
    ctx.arc(p.x, p.y, 0, 0, 0 * Math.PI);
    ctx.fill();
}

function randomIntFromInterval(mn, mx) {
    return ~~(Math.random() * (mx - mn + 1) + mn);
}



/* Letter animation */

var words = document.getElementsByClassName('word');
var wordArray = [];
var currentWord = 0;

words[currentWord].style.opacity = 1;
for (var i = 0; i < words.length; i++) {
    splitLetters(words[i]);
}

function changeWord() {
    var cw = wordArray[currentWord];
    var nw = currentWord == words.length-1 ? wordArray[0] : wordArray[currentWord+1];
    for (var i = 0; i < cw.length; i++) {
        if (i != cw.length-1) {
            animateLetterOut(cw, i, 0);
        } else {
            animateLetterOut(cw, i, 1);
        }
    }
    for (var i = 0; i < nw.length; i++) {
        nw[0].parentElement.style.opacity = 1;
        if (i != nw.length-1) {
            nw[i].className = 'letter behind';
            animateLetterIn(nw, i, 0);
        } else {
            nw[i].className = 'letter behind last';
            animateLetterIn(nw, i, 1);
        }

    }
    currentWord = (currentWord == wordArray.length-1) ? 0 : currentWord+1;
}

function animateLetterOut(cw, i, l) {
    setTimeout(function() {
        if (l != 1) {
            cw[i].className = 'letter out';
        } else {
            cw[i].className = 'letter out last';
        }
    }, i*80);
}

function animateLetterIn(nw, i, l) {
    setTimeout(function() {
        if (l != 1) {
            nw[i].className = 'letter in';
        } else {
            nw[i].className = 'letter in last';
        }
    }, 340+(i*80));
}

function splitLetters(word) {
    var content = word.innerHTML;
    word.innerHTML = '';
    var letters = [];
    for (var i = 0; i < content.length; i++) {
        var letter = document.createElement('span');
        if (i != content.length-1) {
            letter.className = 'letter';
        } else {
            letter.className = 'letter last';
        }
        letter.innerHTML = content.charAt(i);
        word.appendChild(letter);
        letters.push(letter);
    }
    wordArray.push(letters);
}

setInterval(changeWord, 4000);



/* Bootstrap doc */

var jekyllBootstrapDoc = {
    buildSideMenu: function() {
        var html = '';

        $('.bs-docs-section').each(function() {
            var h1 = $(this).find('h1[id]').first(),
                h23 = $(this).find('h2[id], h3[id]:not([data-no-menu])');

            if (h1.length) {
                html += '<li><a href="#' + h1[0].id + '">' + h1.clone().children().remove().end().text() + '</a>';
                if (h23.length) {
                    html += '<ul class="nav">';
                    h23.each(function() {
                        html += '<li><a href="#' + this.id + '">' + $(this).clone().children().remove().end().text() + '</a></li>';
                    });
                    html += '</ul>';
                }
                html += '</li>';
            }
        });

        if (html == '') {
            $('[role=complementary]').hide();
            $('[role=main]').removeClass('col-md-9').addClass('col-md-12');
        } else {
            $('[role=complementary]').show();
            $('[role=main]').removeClass('col-md-12').addClass('col-md-9');
            $('.bs-docs-sidenav').html(html);
        }
    },

    addHeadingAnchors: function() {
        $('h1[id], h2[id], h3[id], h4[id], h5[id]').each(function() {
            if ($(this).children('.anchor-link').length === 0) {
                $(this).prepend('<a href="#' + this.id + '" class="anchor-link">§</i>');
            }
        });
    },

    enableBootbox: function() {
        $('[data-bootbox]').off('click').on('click', function() {
            var $target = $('#' + $(this).data('bootbox'));
            bootbox.alert({
                title: $target.attr('title'),
                message: $target.html(),
                size: $(this).data('bootbox-size')
            });
        });
    },

    trianglify: function(color1, color2, seed) {
        var header = $('#content');
        var pattern = Trianglify({
            width: window.screen.width | header.outerWidth(),
            height: header.outerHeight(),
            cell_size: 90,
            seed: seed,
            x_colors: [color1, color2]
        });
        header.css('background-image', 'url(' + pattern.png() + ')');
    }
};

$(function() {

  jekyllBootstrapDoc.buildSideMenu();
  jekyllBootstrapDoc.addHeadingAnchors();
  jekyllBootstrapDoc.enableBootbox();

});
