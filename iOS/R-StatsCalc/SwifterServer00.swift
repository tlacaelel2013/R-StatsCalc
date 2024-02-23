//
//  SwifterServer00.swift
//  LinuxShell00
//
//  Created by Luis Acevedo-Arreguin on 9/15/22.
//

import Foundation


//  https://github.com/httpswift/swifter




/*
 
 https://github.com/httpswift/swifter/blob/stable/LICENSE
 
 
 Copyright (c) 2014, Damian Kołakowski
 All rights reserved.

 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are met:

 * Redistributions of source code must retain the above copyright notice, this
   list of conditions and the following disclaimer.

 * Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation
   and/or other materials provided with the distribution.

 * Neither the name of the {organization} nor the names of its
   contributors may be used to endorse or promote products derived from
   this software without specific prior written permission.

 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
 FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 
 
 */



/*
 
 https://github.com/httpswift/swifter/blob/stable/Xcode/Sources/MimeTypes.swift
 */



internal let DEFAULT_MIME_TYPE = "application/octet-stream"

internal let mimeTypes = [
    "html": "text/html",
    "htm": "text/html",
    "shtml": "text/html",
    "css": "text/css",
    "xml": "text/xml",
    "gif": "image/gif",
    "jpeg": "image/jpeg",
    "jpg": "image/jpeg",
    "js": "application/javascript",
    "atom": "application/atom+xml",
    "rss": "application/rss+xml",
    "mml": "text/mathml",
    "txt": "text/plain",
    "jad": "text/vnd.sun.j2me.app-descriptor",
    "wml": "text/vnd.wap.wml",
    "htc": "text/x-component",
    "png": "image/png",
    "tif": "image/tiff",
    "tiff": "image/tiff",
    "wbmp": "image/vnd.wap.wbmp",
    "ico": "image/x-icon",
    "jng": "image/x-jng",
    "bmp": "image/x-ms-bmp",
    "svg": "image/svg+xml",
    "svgz": "image/svg+xml",
    "webp": "image/webp",
    "woff": "application/font-woff",
    "jar": "application/java-archive",
    "war": "application/java-archive",
    "ear": "application/java-archive",
    "json": "application/json",
    "hqx": "application/mac-binhex40",
    "doc": "application/msword",
    "pdf": "application/pdf",
    "ps": "application/postscript",
    "eps": "application/postscript",
    "ai": "application/postscript",
    "rtf": "application/rtf",
    "m3u8": "application/vnd.apple.mpegurl",
    "xls": "application/vnd.ms-excel",
    "eot": "application/vnd.ms-fontobject",
    "ppt": "application/vnd.ms-powerpoint",
    "wmlc": "application/vnd.wap.wmlc",
    "kml": "application/vnd.google-earth.kml+xml",
    "kmz": "application/vnd.google-earth.kmz",
    "7z": "application/x-7z-compressed",
    "cco": "application/x-cocoa",
    "jardiff": "application/x-java-archive-diff",
    "jnlp": "application/x-java-jnlp-file",
    "run": "application/x-makeself",
    "pl": "application/x-perl",
    "pm": "application/x-perl",
    "prc": "application/x-pilot",
    "pdb": "application/x-pilot",
    "rar": "application/x-rar-compressed",
    "rpm": "application/x-redhat-package-manager",
    "sea": "application/x-sea",
    "swf": "application/x-shockwave-flash",
    "sit": "application/x-stuffit",
    "tcl": "application/x-tcl",
    "tk": "application/x-tcl",
    "der": "application/x-x509-ca-cert",
    "pem": "application/x-x509-ca-cert",
    "crt": "application/x-x509-ca-cert",
    "xpi": "application/x-xpinstall",
    "xhtml": "application/xhtml+xml",
    "xspf": "application/xspf+xml",
    "zip": "application/zip",
    "bin": "application/octet-stream",
    "exe": "application/octet-stream",
    "dll": "application/octet-stream",
    "deb": "application/octet-stream",
    "dmg": "application/octet-stream",
    "iso": "application/octet-stream",
    "img": "application/octet-stream",
    "msi": "application/octet-stream",
    "msp": "application/octet-stream",
    "msm": "application/octet-stream",
    "docx": "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
    "xlsx": "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
    "pptx": "application/vnd.openxmlformats-officedocument.presentationml.presentation",
    "mid": "audio/midi",
    "midi": "audio/midi",
    "kar": "audio/midi",
    "mp3": "audio/mpeg",
    "ogg": "audio/ogg",
    "m4a": "audio/x-m4a",
    "ra": "audio/x-realaudio",
    "3gpp": "video/3gpp",
    "3gp": "video/3gpp",
    "ts": "video/mp2t",
    "mp4": "video/mp4",
    "mpeg": "video/mpeg",
    "mpg": "video/mpeg",
    "mov": "video/quicktime",
    "webm": "video/webm",
    "flv": "video/x-flv",
    "m4v": "video/x-m4v",
    "mng": "video/x-mng",
    "asx": "video/x-ms-asf",
    "asf": "video/x-ms-asf",
    "wmv": "video/x-ms-wmv",
    "avi": "video/x-msvideo"
]

internal func matchMimeType(extens: String?) -> String {
    if extens != nil && mimeTypes.contains(where: { $0.0 == extens!.lowercased() }) {
        return mimeTypes[extens!.lowercased()]!
    }
    return DEFAULT_MIME_TYPE
}

extension NSURL {
    public func mimeType() -> String {
        return matchMimeType(extens: self.pathExtension)
    }
}

extension NSString {
    public func mimeType() -> String {
        return matchMimeType(extens: self.pathExtension)
    }
}

extension String {
    public func mimeType() -> String {
        return (NSString(string: self)).mimeType()
    }
}



/*
 
 https://github.com/httpswift/swifter/blob/stable/Xcode/Sources/Process.swift
 */




public class Process {

    public static var pid: Int {
        return Int(getpid())
    }

    public static var tid: UInt64 {
        #if os(Linux)
            return UInt64(pthread_self())
        #else
            var tid: __uint64_t = 0
            pthread_threadid_np(nil, &tid)
            return UInt64(tid)
        #endif
    }

    private static var signalsWatchers = [(Int32) -> Void]()
    private static var signalsObserved = false

    public static func watchSignals(_ callback: @escaping (Int32) -> Void) {
        if !signalsObserved {
            [SIGTERM, SIGHUP, SIGSTOP, SIGINT].forEach { item in
                signal(item) { signum in
                    Process.signalsWatchers.forEach { $0(signum) }
                }
            }
            signalsObserved = true
        }
        signalsWatchers.append(callback)
    }
}



/*
 
 https://github.com/httpswift/swifter/blob/stable/Xcode/Sources/Scopes.swift
 */



public func scopes(_ scope: @escaping Closure) -> ((HttpRequest) -> HttpResponse) {
    return { _ in
        scopesBuffer[Process.tid] = ""
        scope()
        return .raw(200, "OK", ["Content-Type": "text/html"], {
            try? $0.write([UInt8](("<!DOCTYPE html>"  + (scopesBuffer[Process.tid] ?? "")).utf8))
        })
    }
}

public typealias Closure = () -> Void

public var idd: String?
public var dir: String?
public var rel: String?
public var rev: String?
public var alt: String?
public var forr: String?
public var src: String?
public var type: String?
public var href: String?
public var text: String?
public var abbr: String?
public var size: String?
public var face: String?
public var char: String?
public var cite: String?
public var span: String?
public var data: String?
public var axis: String?
public var Name: String?
public var name: String?
public var code: String?
public var link: String?
public var lang: String?
public var cols: String?
public var rows: String?
public var ismap: String?
public var shape: String?
public var style: String?
public var alink: String?
public var width: String?
public var rules: String?
public var align: String?
public var frame: String?
public var vlink: String?
public var deferr: String?
public var color: String?
public var media: String?
public var title: String?
public var scope: String?
public var classs: String?
public var manifest: String?
public var value: String?
public var clear: String?
public var start: String?
public var label: String?
public var action: String?
public var height: String?
public var method: String?
public var acceptt: String?
public var object: String?
public var scheme: String?
public var coords: String?
public var usemap: String?
public var onblur: String?
public var nohref: String?
public var nowrap: String?
public var hspace: String?
public var border: String?
public var valign: String?
public var vspace: String?
public var onload: String?
public var target: String?
public var prompt: String?
public var onfocus: String?
public var enctype: String?
public var onclick: String?
public var ontouchstart: String?
public var onkeyup: String?
public var profile: String?
public var version: String?
public var onreset: String?
public var charset: String?
public var standby: String?
public var colspan: String?
public var charoff: String?
public var classid: String?
public var compact: String?
public var declare: String?
public var rowspan: String?
public var checked: String?
public var archive: String?
public var bgcolor: String?
public var content: String?
public var noshade: String?
public var summary: String?
public var headers: String?
public var onselect: String?
public var readonly: String?
public var tabindex: String?
public var onchange: String?
public var noresize: String?
public var disabled: String?
public var longdesc: String?
public var codebase: String?
public var language: String?
public var datetime: String?
public var selected: String?
public var hreflang: String?
public var onsubmit: String?
public var multiple: String?
public var onunload: String?
public var codetype: String?
public var scrolling: String?
public var onkeydown: String?
public var maxlength: String?
public var valuetype: String?
public var accesskey: String?
public var onmouseup: String?
public var autofocus: String?
public var onkeypress: String?
public var ondblclick: String?
public var onmouseout: String?
public var httpEquiv: String?
public var dataText: String?
public var background: String?
public var onmousemove: String?
public var onmouseover: String?
public var cellpadding: String?
public var onmousedown: String?
public var frameborder: String?
public var marginwidth: String?
public var cellspacing: String?
public var placeholder: String?
public var marginheight: String?
public var acceptCharset: String?

public var inner: String?

public func a(_ closure: Closure) { element("a", closure) }
public func b(_ closure: Closure) { element("b", closure) }
public func i(_ closure: Closure) { element("i", closure) }
public func p(_ closure: Closure) { element("p", closure) }
public func q(_ closure: Closure) { element("q", closure) }
public func s(_ closure: Closure) { element("s", closure) }
public func u(_ closure: Closure) { element("u", closure) }

public func br(_ closure: Closure) { element("br", closure) }
public func dd(_ closure: Closure) { element("dd", closure) }
public func dl(_ closure: Closure) { element("dl", closure) }
public func dt(_ closure: Closure) { element("dt", closure) }
public func em(_ closure: Closure) { element("em", closure) }
public func hr(_ closure: Closure) { element("hr", closure) }
public func li(_ closure: Closure) { element("li", closure) }
public func ol(_ closure: Closure) { element("ol", closure) }
public func rp(_ closure: Closure) { element("rp", closure) }
public func rt(_ closure: Closure) { element("rt", closure) }
public func td(_ closure: Closure) { element("td", closure) }
public func th(_ closure: Closure) { element("th", closure) }
public func tr(_ closure: Closure) { element("tr", closure) }
public func tt(_ closure: Closure) { element("tt", closure) }
public func ul(_ closure: Closure) { element("ul", closure) }

public func ul<T: Sequence>(_ collection: T, _ closure: @escaping (T.Iterator.Element) -> Void) {
    element("ul", {
        for item in collection {
            closure(item)
        }
    })
}

public func h1(_ closure: Closure) { element("h1", closure) }
public func h2(_ closure: Closure) { element("h2", closure) }
public func h3(_ closure: Closure) { element("h3", closure) }
public func h4(_ closure: Closure) { element("h4", closure) }
public func h5(_ closure: Closure) { element("h5", closure) }
public func h6(_ closure: Closure) { element("h6", closure) }

public func bdi(_ closure: Closure) { element("bdi", closure) }
public func bdo(_ closure: Closure) { element("bdo", closure) }
public func big(_ closure: Closure) { element("big", closure) }
public func col(_ closure: Closure) { element("col", closure) }
public func del(_ closure: Closure) { element("del", closure) }
public func dfn(_ closure: Closure) { element("dfn", closure) }
public func dir(_ closure: Closure) { element("dir", closure) }
public func div(_ closure: Closure) { element("div", closure) }
public func img(_ closure: Closure) { element("img", closure) }
public func ins(_ closure: Closure) { element("ins", closure) }
public func kbd(_ closure: Closure) { element("kbd", closure) }
public func map(_ closure: Closure) { element("map", closure) }
public func nav(_ closure: Closure) { element("nav", closure) }
public func pre(_ closure: Closure) { element("pre", closure) }
public func rtc(_ closure: Closure) { element("rtc", closure) }
public func sub(_ closure: Closure) { element("sub", closure) }
public func sup(_ closure: Closure) { element("sup", closure) }

public func varr(_ closure: Closure) { element("var", closure) }
public func wbr(_ closure: Closure) { element("wbr", closure) }
public func xmp(_ closure: Closure) { element("xmp", closure) }

public func abbr(_ closure: Closure) { element("abbr", closure) }
public func area(_ closure: Closure) { element("area", closure) }
public func base(_ closure: Closure) { element("base", closure) }
public func body(_ closure: Closure) { element("body", closure) }
public func cite(_ closure: Closure) { element("cite", closure) }
public func code(_ closure: Closure) { element("code", closure) }
public func data(_ closure: Closure) { element("data", closure) }
public func font(_ closure: Closure) { element("font", closure) }
public func form(_ closure: Closure) { element("form", closure) }
public func head(_ closure: Closure) { element("head", closure) }
public func html(_ closure: Closure) { element("html", closure) }
public func link(_ closure: Closure) { element("link", closure) }
public func main(_ closure: Closure) { element("main", closure) }
public func mark(_ closure: Closure) { element("mark", closure) }
public func menu(_ closure: Closure) { element("menu", closure) }
public func meta(_ closure: Closure) { element("meta", closure) }
public func nobr(_ closure: Closure) { element("nobr", closure) }
public func ruby(_ closure: Closure) { element("ruby", closure) }
public func samp(_ closure: Closure) { element("samp", closure) }
public func span(_ closure: Closure) { element("span", closure) }
public func time(_ closure: Closure) { element("time", closure) }

public func aside(_ closure: Closure) { element("aside", closure) }
public func audio(_ closure: Closure) { element("audio", closure) }
public func blink(_ closure: Closure) { element("blink", closure) }
public func embed(_ closure: Closure) { element("embed", closure) }
public func frame(_ closure: Closure) { element("frame", closure) }
public func image(_ closure: Closure) { element("image", closure) }
public func input(_ closure: Closure) { element("input", closure) }
public func label(_ closure: Closure) { element("label", closure) }
public func meter(_ closure: Closure) { element("meter", closure) }
public func param(_ closure: Closure) { element("param", closure) }
public func small(_ closure: Closure) { element("small", closure) }
public func style(_ closure: Closure) { element("style", closure) }
public func table(_ closure: Closure) { element("table", closure) }

public func table<T: Sequence>(_ collection: T, closure: @escaping (T.Iterator.Element) -> Void) {
    element("table", {
        for item in collection {
            closure(item)
        }
    })
}

public func tbody(_ closure: Closure) { element("tbody", closure) }

public func tbody<T: Sequence>(_ collection: T, closure: @escaping (T.Iterator.Element) -> Void) {
    element("tbody", {
        for item in collection {
            closure(item)
        }
    })
}

public func tfoot(_ closure: Closure) { element("tfoot", closure) }
public func thead(_ closure: Closure) { element("thead", closure) }
public func title(_ closure: Closure) { element("title", closure) }
public func track(_ closure: Closure) { element("track", closure) }
public func video(_ closure: Closure) { element("video", closure) }

public func applet(_ closure: Closure) { element("applet", closure) }
public func button(_ closure: Closure) { element("button", closure) }
public func canvas(_ closure: Closure) { element("canvas", closure) }
public func center(_ closure: Closure) { element("center", closure) }
public func dialog(_ closure: Closure) { element("dialog", closure) }
public func figure(_ closure: Closure) { element("figure", closure) }
public func footer(_ closure: Closure) { element("footer", closure) }
public func header(_ closure: Closure) { element("header", closure) }
public func hgroup(_ closure: Closure) { element("hgroup", closure) }
public func iframe(_ closure: Closure) { element("iframe", closure) }
public func keygen(_ closure: Closure) { element("keygen", closure) }
public func legend(_ closure: Closure) { element("legend", closure) }
public func object(_ closure: Closure) { element("object", closure) }
public func option(_ closure: Closure) { element("option", closure) }
public func output(_ closure: Closure) { element("output", closure) }
public func script(_ closure: Closure) { element("script", closure) }
public func select(_ closure: Closure) { element("select", closure) }
public func shadow(_ closure: Closure) { element("shadow", closure) }
public func source(_ closure: Closure) { element("source", closure) }
public func spacer(_ closure: Closure) { element("spacer", closure) }
public func strike(_ closure: Closure) { element("strike", closure) }
public func strong(_ closure: Closure) { element("strong", closure) }

public func acronym(_ closure: Closure) { element("acronym", closure) }
public func address(_ closure: Closure) { element("address", closure) }
public func article(_ closure: Closure) { element("article", closure) }
public func bgsound(_ closure: Closure) { element("bgsound", closure) }
public func caption(_ closure: Closure) { element("caption", closure) }
public func command(_ closure: Closure) { element("command", closure) }
public func content(_ closure: Closure) { element("content", closure) }
public func details(_ closure: Closure) { element("details", closure) }
public func elementt(_ closure: Closure) { element("element", closure) }
public func isindex(_ closure: Closure) { element("isindex", closure) }
public func listing(_ closure: Closure) { element("listing", closure) }
public func marquee(_ closure: Closure) { element("marquee", closure) }
public func noembed(_ closure: Closure) { element("noembed", closure) }
public func picture(_ closure: Closure) { element("picture", closure) }
public func section(_ closure: Closure) { element("section", closure) }
public func summary(_ closure: Closure) { element("summary", closure) }

public func basefont(_ closure: Closure) { element("basefont", closure) }
public func colgroup(_ closure: Closure) { element("colgroup", closure) }
public func datalist(_ closure: Closure) { element("datalist", closure) }
public func fieldset(_ closure: Closure) { element("fieldset", closure) }
public func frameset(_ closure: Closure) { element("frameset", closure) }
public func menuitem(_ closure: Closure) { element("menuitem", closure) }
public func multicol(_ closure: Closure) { element("multicol", closure) }
public func noframes(_ closure: Closure) { element("noframes", closure) }
public func noscript(_ closure: Closure) { element("noscript", closure) }
public func optgroup(_ closure: Closure) { element("optgroup", closure) }
public func progress(_ closure: Closure) { element("progress", closure) }
public func template(_ closure: Closure) { element("template", closure) }
public func textarea(_ closure: Closure) { element("textarea", closure) }

public func plaintext(_ closure: Closure) { element("plaintext", closure) }
public func javascript(_ closure: Closure) { element("script", ["type": "text/javascript"], closure) }
public func blockquote(_ closure: Closure) { element("blockquote", closure) }
public func figcaption(_ closure: Closure) { element("figcaption", closure) }

public func stylesheet(_ closure: Closure) { element("link", ["rel": "stylesheet", "type": "text/css"], closure) }

public func element(_ node: String, _ closure: Closure) { evaluate(node, [:], closure) }
public func element(_ node: String, _ attrs: [String: String?] = [:], _ closure: Closure) { evaluate(node, attrs, closure) }

var scopesBuffer = [UInt64: String]()

// swiftlint:disable cyclomatic_complexity function_body_length
private func evaluate(_ node: String, _ attrs: [String: String?] = [:], _ closure: Closure) {

    // Push the attributes.
    let stackid = idd
    let stackdir = dir
    let stackrel = rel
    let stackrev = rev
    let stackalt = alt
    let stackfor = forr
    let stacksrc = src
    let stacktype = type
    let stackhref = href
    let stacktext = text
    let stackabbr = abbr
    let stacksize = size
    let stackface = face
    let stackchar = char
    let stackcite = cite
    let stackspan = span
    let stackdata = data
    let stackaxis = axis
    let stackName = Name
    let stackname = name
    let stackcode = code
    let stacklink = link
    let stacklang = lang
    let stackcols = cols
    let stackrows = rows
    let stackismap = ismap
    let stackshape = shape
    let stackstyle = style
    let stackalink = alink
    let stackwidth = width
    let stackrules = rules
    let stackalign = align
    let stackframe = frame
    let stackvlink = vlink
    let stackdefer = deferr
    let stackcolor = color
    let stackmedia = media
    let stacktitle = title
    let stackscope = scope
    let stackclass = classs
    let stackmanifest = manifest
    let stackvalue = value
    let stackclear = clear
    let stackstart = start
    let stacklabel = label
    let stackaction = action
    let stackheight = height
    let stackmethod = method
    let stackaccept = acceptt
    let stackobject = object
    let stackscheme = scheme
    let stackcoords = coords
    let stackusemap = usemap
    let stackonblur = onblur
    let stacknohref = nohref
    let stacknowrap = nowrap
    let stackhspace = hspace
    let stackborder = border
    let stackvalign = valign
    let stackvspace = vspace
    let stackonload = onload
    let stacktarget = target
    let stackprompt = prompt
    let stackonfocus = onfocus
    let stackenctype = enctype
    let stackonclick = onclick
    let stackontouchstart = ontouchstart
    let stackonkeyup = onkeyup
    let stackprofile = profile
    let stackversion = version
    let stackonreset = onreset
    let stackcharset = charset
    let stackstandby = standby
    let stackcolspan = colspan
    let stackcharoff = charoff
    let stackclassid = classid
    let stackcompact = compact
    let stackdeclare = declare
    let stackrowspan = rowspan
    let stackchecked = checked
    let stackarchive = archive
    let stackbgcolor = bgcolor
    let stackcontent = content
    let stacknoshade = noshade
    let stacksummary = summary
    let stackheaders = headers
    let stackonselect = onselect
    let stackreadonly = readonly
    let stacktabindex = tabindex
    let stackonchange = onchange
    let stacknoresize = noresize
    let stackdisabled = disabled
    let stacklongdesc = longdesc
    let stackcodebase = codebase
    let stacklanguage = language
    let stackdatetime = datetime
    let stackselected = selected
    let stackhreflang = hreflang
    let stackonsubmit = onsubmit
    let stackmultiple = multiple
    let stackonunload = onunload
    let stackcodetype = codetype
    let stackscrolling = scrolling
    let stackonkeydown = onkeydown
    let stackmaxlength = maxlength
    let stackvaluetype = valuetype
    let stackaccesskey = accesskey
    let stackonmouseup = onmouseup
    let stackonkeypress = onkeypress
    let stackondblclick = ondblclick
    let stackonmouseout = onmouseout
    let stackhttpEquiv = httpEquiv
    let stackdataText = dataText
    let stackbackground = background
    let stackonmousemove = onmousemove
    let stackonmouseover = onmouseover
    let stackcellpadding = cellpadding
    let stackonmousedown = onmousedown
    let stackframeborder = frameborder
    let stackmarginwidth = marginwidth
    let stackcellspacing = cellspacing
    let stackplaceholder = placeholder
    let stackmarginheight = marginheight
    let stackacceptCharset = acceptCharset
    let stackinner = inner

    // Reset the values before a nested scope evalutation.
    idd = nil
    dir = nil
    rel = nil
    rev = nil
    alt = nil
    forr = nil
    src = nil
    type = nil
    href = nil
    text = nil
    abbr = nil
    size = nil
    face = nil
    char = nil
    cite = nil
    span = nil
    data = nil
    axis = nil
    Name = nil
    name = nil
    code = nil
    link = nil
    lang = nil
    cols = nil
    rows = nil
    ismap = nil
    shape = nil
    style = nil
    alink = nil
    width = nil
    rules = nil
    align = nil
    frame = nil
    vlink = nil
    deferr = nil
    color = nil
    media = nil
    title = nil
    scope = nil
    classs = nil
    manifest = nil
    value = nil
    clear = nil
    start = nil
    label = nil
    action = nil
    height = nil
    method = nil
    acceptt = nil
    object = nil
    scheme = nil
    coords = nil
    usemap = nil
    onblur = nil
    nohref = nil
    nowrap = nil
    hspace = nil
    border = nil
    valign = nil
    vspace = nil
    onload = nil
    target = nil
    prompt = nil
    onfocus = nil
    enctype = nil
    onclick = nil
    ontouchstart = nil
    onkeyup = nil
    profile = nil
    version = nil
    onreset = nil
    charset = nil
    standby = nil
    colspan = nil
    charoff = nil
    classid = nil
    compact = nil
    declare = nil
    rowspan = nil
    checked = nil
    archive = nil
    bgcolor = nil
    content = nil
    noshade = nil
    summary = nil
    headers = nil
    onselect = nil
    readonly = nil
    tabindex = nil
    onchange = nil
    noresize = nil
    disabled = nil
    longdesc = nil
    codebase = nil
    language = nil
    datetime = nil
    selected = nil
    hreflang = nil
    onsubmit = nil
    multiple = nil
    onunload = nil
    codetype = nil
    scrolling = nil
    onkeydown = nil
    maxlength = nil
    valuetype = nil
    accesskey = nil
    onmouseup = nil
    onkeypress = nil
    ondblclick = nil
    onmouseout = nil
    httpEquiv = nil
    dataText = nil
    background = nil
    onmousemove = nil
    onmouseover = nil
    cellpadding = nil
    onmousedown = nil
    frameborder = nil
    placeholder = nil
    marginwidth = nil
    cellspacing = nil
    marginheight = nil
    acceptCharset = nil
    inner = nil

    scopesBuffer[Process.tid] = (scopesBuffer[Process.tid] ?? "") + "<" + node

    // Save the current output before the nested scope evalutation.
    var output = scopesBuffer[Process.tid] ?? ""

    // Clear the output buffer for the evalutation.
    scopesBuffer[Process.tid] = ""

    // Evaluate the nested scope.
    closure()

    // Render attributes set by the evalutation.
    var mergedAttributes = [String: String?]()

    if let idd = idd { mergedAttributes["id"] = idd }
    if let dir = dir { mergedAttributes["dir"] = dir }
    if let rel = rel { mergedAttributes["rel"] = rel }
    if let rev = rev { mergedAttributes["rev"] = rev }
    if let alt = alt { mergedAttributes["alt"] = alt }
    if let forr = forr { mergedAttributes["for"] = forr }
    if let src = src { mergedAttributes["src"] = src }
    if let type = type { mergedAttributes["type"] = type }
    if let href = href { mergedAttributes["href"] = href }
    if let text = text { mergedAttributes["text"] = text }
    if let abbr = abbr { mergedAttributes["abbr"] = abbr }
    if let size = size { mergedAttributes["size"] = size }
    if let face = face { mergedAttributes["face"] = face }
    if let char = char { mergedAttributes["char"] = char }
    if let cite = cite { mergedAttributes["cite"] = cite }
    if let span = span { mergedAttributes["span"] = span }
    if let data = data { mergedAttributes["data"] = data }
    if let axis = axis { mergedAttributes["axis"] = axis }
    if let Name = Name { mergedAttributes["Name"] = Name }
    if let name = name { mergedAttributes["name"] = name }
    if let code = code { mergedAttributes["code"] = code }
    if let link = link { mergedAttributes["link"] = link }
    if let lang = lang { mergedAttributes["lang"] = lang }
    if let cols = cols { mergedAttributes["cols"] = cols }
    if let rows = rows { mergedAttributes["rows"] = rows }
    if let ismap = ismap { mergedAttributes["ismap"] = ismap }
    if let shape = shape { mergedAttributes["shape"] = shape }
    if let style = style { mergedAttributes["style"] = style }
    if let alink = alink { mergedAttributes["alink"] = alink }
    if let width = width { mergedAttributes["width"] = width }
    if let rules = rules { mergedAttributes["rules"] = rules }
    if let align = align { mergedAttributes["align"] = align }
    if let frame = frame { mergedAttributes["frame"] = frame }
    if let vlink = vlink { mergedAttributes["vlink"] = vlink }
    if let deferr = deferr { mergedAttributes["defer"] = deferr }
    if let color = color { mergedAttributes["color"] = color }
    if let media = media { mergedAttributes["media"] = media }
    if let title = title { mergedAttributes["title"] = title }
    if let scope = scope { mergedAttributes["scope"] = scope }
    if let classs = classs { mergedAttributes["class"] = classs }
    if let manifest = manifest { mergedAttributes["manifest"] = manifest }
    if let value = value { mergedAttributes["value"] = value }
    if let clear = clear { mergedAttributes["clear"] = clear }
    if let start = start { mergedAttributes["start"] = start }
    if let label = label { mergedAttributes["label"] = label }
    if let action = action { mergedAttributes["action"] = action }
    if let height = height { mergedAttributes["height"] = height }
    if let method = method { mergedAttributes["method"] = method }
    if let acceptt = acceptt { mergedAttributes["accept"] = acceptt }
    if let object = object { mergedAttributes["object"] = object }
    if let scheme = scheme { mergedAttributes["scheme"] = scheme }
    if let coords = coords { mergedAttributes["coords"] = coords }
    if let usemap = usemap { mergedAttributes["usemap"] = usemap }
    if let onblur = onblur { mergedAttributes["onblur"] = onblur }
    if let nohref = nohref { mergedAttributes["nohref"] = nohref }
    if let nowrap = nowrap { mergedAttributes["nowrap"] = nowrap }
    if let hspace = hspace { mergedAttributes["hspace"] = hspace }
    if let border = border { mergedAttributes["border"] = border }
    if let valign = valign { mergedAttributes["valign"] = valign }
    if let vspace = vspace { mergedAttributes["vspace"] = vspace }
    if let onload = onload { mergedAttributes["onload"] = onload }
    if let target = target { mergedAttributes["target"] = target }
    if let prompt = prompt { mergedAttributes["prompt"] = prompt }
    if let onfocus = onfocus { mergedAttributes["onfocus"] = onfocus }
    if let enctype = enctype { mergedAttributes["enctype"] = enctype }
    if let onclick = onclick { mergedAttributes["onclick"] = onclick }
    if let ontouchstart = ontouchstart { mergedAttributes["ontouchstart"] = ontouchstart }
    if let onkeyup = onkeyup { mergedAttributes["onkeyup"] = onkeyup }
    if let profile = profile { mergedAttributes["profile"] = profile }
    if let version = version { mergedAttributes["version"] = version }
    if let onreset = onreset { mergedAttributes["onreset"] = onreset }
    if let charset = charset { mergedAttributes["charset"] = charset }
    if let standby = standby { mergedAttributes["standby"] = standby }
    if let colspan = colspan { mergedAttributes["colspan"] = colspan }
    if let charoff = charoff { mergedAttributes["charoff"] = charoff }
    if let classid = classid { mergedAttributes["classid"] = classid }
    if let compact = compact { mergedAttributes["compact"] = compact }
    if let declare = declare { mergedAttributes["declare"] = declare }
    if let rowspan = rowspan { mergedAttributes["rowspan"] = rowspan }
    if let checked = checked { mergedAttributes["checked"] = checked }
    if let archive = archive { mergedAttributes["archive"] = archive }
    if let bgcolor = bgcolor { mergedAttributes["bgcolor"] = bgcolor }
    if let content = content { mergedAttributes["content"] = content }
    if let noshade = noshade { mergedAttributes["noshade"] = noshade }
    if let summary = summary { mergedAttributes["summary"] = summary }
    if let headers = headers { mergedAttributes["headers"] = headers }
    if let onselect = onselect { mergedAttributes["onselect"] = onselect }
    if let readonly = readonly { mergedAttributes["readonly"] = readonly }
    if let tabindex = tabindex { mergedAttributes["tabindex"] = tabindex }
    if let onchange = onchange { mergedAttributes["onchange"] = onchange }
    if let noresize = noresize { mergedAttributes["noresize"] = noresize }
    if let disabled = disabled { mergedAttributes["disabled"] = disabled }
    if let longdesc = longdesc { mergedAttributes["longdesc"] = longdesc }
    if let codebase = codebase { mergedAttributes["codebase"] = codebase }
    if let language = language { mergedAttributes["language"] = language }
    if let datetime = datetime { mergedAttributes["datetime"] = datetime }
    if let selected = selected { mergedAttributes["selected"] = selected }
    if let hreflang = hreflang { mergedAttributes["hreflang"] = hreflang }
    if let onsubmit = onsubmit { mergedAttributes["onsubmit"] = onsubmit }
    if let multiple = multiple { mergedAttributes["multiple"] = multiple }
    if let onunload = onunload { mergedAttributes["onunload"] = onunload }
    if let codetype = codetype { mergedAttributes["codetype"] = codetype }
    if let scrolling = scrolling { mergedAttributes["scrolling"] = scrolling }
    if let onkeydown = onkeydown { mergedAttributes["onkeydown"] = onkeydown }
    if let maxlength = maxlength { mergedAttributes["maxlength"] = maxlength }
    if let valuetype = valuetype { mergedAttributes["valuetype"] = valuetype }
    if let accesskey = accesskey { mergedAttributes["accesskey"] = accesskey }
    if let onmouseup = onmouseup { mergedAttributes["onmouseup"] = onmouseup }
    if let onkeypress = onkeypress { mergedAttributes["onkeypress"] = onkeypress }
    if let ondblclick = ondblclick { mergedAttributes["ondblclick"] = ondblclick }
    if let onmouseout = onmouseout { mergedAttributes["onmouseout"] = onmouseout }
    if let httpEquiv = httpEquiv { mergedAttributes["http-equiv"] = httpEquiv }
    if let dataText = dataText { mergedAttributes["data-text"] = dataText }
    if let background = background { mergedAttributes["background"] = background }
    if let onmousemove = onmousemove { mergedAttributes["onmousemove"] = onmousemove }
    if let onmouseover = onmouseover { mergedAttributes["onmouseover"] = onmouseover }
    if let cellpadding = cellpadding { mergedAttributes["cellpadding"] = cellpadding }
    if let onmousedown = onmousedown { mergedAttributes["onmousedown"] = onmousedown }
    if let frameborder = frameborder { mergedAttributes["frameborder"] = frameborder }
    if let marginwidth = marginwidth { mergedAttributes["marginwidth"] = marginwidth }
    if let cellspacing = cellspacing { mergedAttributes["cellspacing"] = cellspacing }
    if let placeholder = placeholder { mergedAttributes["placeholder"] = placeholder }
    if let marginheight = marginheight { mergedAttributes["marginheight"] = marginheight }
    if let acceptCharset = acceptCharset { mergedAttributes["accept-charset"] = acceptCharset }

    for item in attrs.enumerated() {
        mergedAttributes.updateValue(item.element.1, forKey: item.element.0)
    }

    output += mergedAttributes.reduce("") { result, item in
        if let value = item.value {
            return result + " \(item.key)=\"\(value)\""
        } else {
            return result
        }
    }

    if let inner = inner {
        scopesBuffer[Process.tid] = output + ">" + (inner) + "</" + node + ">"
    } else {
        let current = scopesBuffer[Process.tid]  ?? ""
        scopesBuffer[Process.tid] = output + ">" + current + "</" + node + ">"
    }

    // Pop the attributes.
    idd = stackid
    dir = stackdir
    rel = stackrel
    rev = stackrev
    alt = stackalt
    forr = stackfor
    src = stacksrc
    type = stacktype
    href = stackhref
    text = stacktext
    abbr = stackabbr
    size = stacksize
    face = stackface
    char = stackchar
    cite = stackcite
    span = stackspan
    data = stackdata
    axis = stackaxis
    Name = stackName
    name = stackname
    code = stackcode
    link = stacklink
    lang = stacklang
    cols = stackcols
    rows = stackrows
    ismap = stackismap
    shape = stackshape
    style = stackstyle
    alink = stackalink
    width = stackwidth
    rules = stackrules
    align = stackalign
    frame = stackframe
    vlink = stackvlink
    deferr = stackdefer
    color = stackcolor
    media = stackmedia
    title = stacktitle
    scope = stackscope
    classs = stackclass
    manifest = stackmanifest
    value = stackvalue
    clear = stackclear
    start = stackstart
    label = stacklabel
    action = stackaction
    height = stackheight
    method = stackmethod
    acceptt = stackaccept
    object = stackobject
    scheme = stackscheme
    coords = stackcoords
    usemap = stackusemap
    onblur = stackonblur
    nohref = stacknohref
    nowrap = stacknowrap
    hspace = stackhspace
    border = stackborder
    valign = stackvalign
    vspace = stackvspace
    onload = stackonload
    target = stacktarget
    prompt = stackprompt
    onfocus = stackonfocus
    enctype = stackenctype
    onclick = stackonclick
    ontouchstart = stackontouchstart
    onkeyup = stackonkeyup
    profile = stackprofile
    version = stackversion
    onreset = stackonreset
    charset = stackcharset
    standby = stackstandby
    colspan = stackcolspan
    charoff = stackcharoff
    classid = stackclassid
    compact = stackcompact
    declare = stackdeclare
    rowspan = stackrowspan
    checked = stackchecked
    archive = stackarchive
    bgcolor = stackbgcolor
    content = stackcontent
    noshade = stacknoshade
    summary = stacksummary
    headers = stackheaders
    onselect = stackonselect
    readonly = stackreadonly
    tabindex = stacktabindex
    onchange = stackonchange
    noresize = stacknoresize
    disabled = stackdisabled
    longdesc = stacklongdesc
    codebase = stackcodebase
    language = stacklanguage
    datetime = stackdatetime
    selected = stackselected
    hreflang = stackhreflang
    onsubmit = stackonsubmit
    multiple = stackmultiple
    onunload = stackonunload
    codetype = stackcodetype
    scrolling = stackscrolling
    onkeydown = stackonkeydown
    maxlength = stackmaxlength
    valuetype = stackvaluetype
    accesskey = stackaccesskey
    onmouseup = stackonmouseup
    onkeypress = stackonkeypress
    ondblclick = stackondblclick
    onmouseout = stackonmouseout
    httpEquiv = stackhttpEquiv
    dataText = stackdataText
    background = stackbackground
    onmousemove = stackonmousemove
    onmouseover = stackonmouseover
    cellpadding = stackcellpadding
    onmousedown = stackonmousedown
    frameborder = stackframeborder
    placeholder = stackplaceholder
    marginwidth = stackmarginwidth
    cellspacing = stackcellspacing
    marginheight = stackmarginheight
    acceptCharset = stackacceptCharset

    inner = stackinner
}


/*
 
 https://github.com/httpswift/swifter/blob/stable/Xcode/Sources/String%2BFile.swift
 */




extension String {

    public enum FileError: Error {
        case error(Int32)
    }

    public class File {

        let pointer: UnsafeMutablePointer<FILE>

        public init(_ pointer: UnsafeMutablePointer<FILE>) {
            self.pointer = pointer
        }

        public func close() {
            fclose(pointer)
        }

        public func seek(_ offset: Int) -> Bool {
            return (fseek(pointer, offset, SEEK_SET) == 0)
        }

        public func read(_ data: inout [UInt8]) throws -> Int {
            if data.count <= 0 {
                return data.count
            }
            let count = fread(&data, 1, data.count, self.pointer)
            if count == data.count {
                return count
            }
            if feof(self.pointer) != 0 {
                return count
            }
            if ferror(self.pointer) != 0 {
                throw FileError.error(errno)
            }
            throw FileError.error(0)
        }

        public func write(_ data: [UInt8]) throws {
            if data.count <= 0 {
                return
            }
            try data.withUnsafeBufferPointer {
                if fwrite($0.baseAddress, 1, data.count, self.pointer) != data.count {
                    throw FileError.error(errno)
                }
            }
        }

        public static func currentWorkingDirectory() throws -> String {
            guard let path = getcwd(nil, 0) else {
                throw FileError.error(errno)
            }
            return String(cString: path)
        }
    }

    public static var pathSeparator = "/"

    public func openNewForWriting() throws -> File {
        return try openFileForMode(self, "wb")
    }

    public func openForReading() throws -> File {
        return try openFileForMode(self, "rb")
    }

    public func openForWritingAndReading() throws -> File {
        return try openFileForMode(self, "r+b")
    }

    public func openFileForMode(_ path: String, _ mode: String) throws -> File {
        guard let file = path.withCString({ pathPointer in mode.withCString({ fopen(pathPointer, $0) }) }) else {
            throw FileError.error(errno)
        }
        return File(file)
    }

    public func exists() throws -> Bool {
        return try self.withStat {
            if $0 != nil {
                return true
            }
            return false
        }
    }

    public func directory() throws -> Bool {
        return try self.withStat {
            if let stat = $0 {
                return stat.st_mode & S_IFMT == S_IFDIR
            }
            return false
        }
    }

    public func files() throws -> [String] {
        guard let dir = self.withCString({ opendir($0) }) else {
            throw FileError.error(errno)
        }
        defer { closedir(dir) }
        var results = [String]()
        while let ent = readdir(dir) {
            var name = ent.pointee.d_name
            let fileName = withUnsafePointer(to: &name) { (ptr) -> String? in
                #if os(Linux)
                  return String(validatingUTF8: ptr.withMemoryRebound(to: CChar.self, capacity: Int(ent.pointee.d_reclen), { (ptrc) -> [CChar] in
                    return [CChar](UnsafeBufferPointer(start: ptrc, count: 256))
                  }))
                #else
                    var buffer = ptr.withMemoryRebound(to: CChar.self, capacity: Int(ent.pointee.d_reclen), { (ptrc) -> [CChar] in
                      return [CChar](UnsafeBufferPointer(start: ptrc, count: Int(ent.pointee.d_namlen)))
                    })
                    buffer.append(0)
                    return String(validatingUTF8: buffer)
                #endif
            }
            if let fileName = fileName {
                results.append(fileName)
            }
        }
        return results
    }

    private func withStat<T>(_ closure: ((stat?) throws -> T)) throws -> T {
        return try self.withCString({
            var statBuffer = stat()
            if stat($0, &statBuffer) == 0 {
                return try closure(statBuffer)
            }
            if errno == ENOENT {
                return try closure(nil)
            }
            throw FileError.error(errno)
        })
    }
}



/*
 
 https://github.com/httpswift/swifter/blob/stable/Xcode/Sources/Files.swift
 */




public func shareFile(_ path: String) -> ((HttpRequest) -> HttpResponse) {
    return { _ in
        if let file = try? path.openForReading() {
            let mimeType = path.mimeType()
            var responseHeader: [String: String] = ["Content-Type": mimeType]
            
            if let attr = try? FileManager.default.attributesOfItem(atPath: path),
                let fileSize = attr[FileAttributeKey.size] as? UInt64 {
                responseHeader["Content-Length"] = String(fileSize)
            }
            return .raw(200, "OK", responseHeader, { writer in
                try? writer.write(file)
                file.close()
            })
        }
        return .notFound()
    }
}

public func shareFilesFromDirectory(_ directoryPath: String, defaults: [String] = ["index.html", "default.html"]) -> ((HttpRequest) -> HttpResponse) {
    return { request in
        guard let fileRelativePath = request.params.first else {
            return .notFound()
        }
        if fileRelativePath.value.isEmpty {
            for path in defaults {
                if let file = try? (directoryPath + String.pathSeparator + path).openForReading() {
                    return .raw(200, "OK", [:], { writer in
                        try? writer.write(file)
                        file.close()
                    })
                }
            }
        }
        let filePath = directoryPath + String.pathSeparator + fileRelativePath.value

        if let file = try? filePath.openForReading() {
            let mimeType = fileRelativePath.value.mimeType()
            var responseHeader: [String: String] = ["Content-Type": mimeType]

            if let attr = try? FileManager.default.attributesOfItem(atPath: filePath),
                let fileSize = attr[FileAttributeKey.size] as? UInt64 {
                responseHeader["Content-Length"] = String(fileSize)
            }

            return .raw(200, "OK", responseHeader, { writer in
                try? writer.write(file)
                file.close()
            })
        }
        return .notFound()
    }
}

public func directoryBrowser(_ dir: String) -> ((HttpRequest) -> HttpResponse) {
    return { request in
        guard let (_, value) = request.params.first else {
            return .notFound()
        }
        let filePath = dir + String.pathSeparator + value
        do {
            guard try filePath.exists() else {
                return .notFound()
            }
            if try filePath.directory() {
                var files = try filePath.files()
                files.sort(by: {$0.lowercased() < $1.lowercased()})
                return scopes {
                    html {
                        body {
                            table(files) { file in
                                tr {
                                    td {
                                        a {
                                            href = request.path + "/" + file
                                            inner = file
                                        }
                                    }
                                }
                            }
                        }
                    }
                    }(request)
            } else {
                guard let file = try? filePath.openForReading() else {
                    return .notFound()
                }
                return .raw(200, "OK", [:], { writer in
                    try? writer.write(file)
                    file.close()
                })
            }
        } catch {
            return HttpResponse.internalServerError(.text("Internal Server Error"))
        }
    }
}



/*
 
 https://github.com/httpswift/swifter/blob/stable/Xcode/Sources/Errno.swift
 */



public class Errno {

    public class func description() -> String {
        // https://forums.developer.apple.com/thread/113919
        return String(cString: strerror(errno))
    }
}


/*
 
 https://github.com/httpswift/swifter/blob/stable/Xcode/Sources/Socket.swift
 */

public enum SocketError: Error {
    case socketCreationFailed(String)
    case socketSettingReUseAddrFailed(String)
    case bindFailed(String)
    case listenFailed(String)
    case writeFailed(String)
    case getPeerNameFailed(String)
    case convertingPeerNameFailed
    case getNameInfoFailed(String)
    case acceptFailed(String)
    case recvFailed(String)
    case getSockNameFailed(String)
}

// swiftlint: disable identifier_name
open class Socket: Hashable, Equatable {

    let socketFileDescriptor: Int32
    private var shutdown = false

    public init(socketFileDescriptor: Int32) {
        self.socketFileDescriptor = socketFileDescriptor
    }

    deinit {
        close()
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.socketFileDescriptor)
    }

    public func close() {
        if shutdown {
            return
        }
        shutdown = true
        Socket.close(self.socketFileDescriptor)
    }

    public func port() throws -> in_port_t {
        var addr = sockaddr_in()
        return try withUnsafePointer(to: &addr) { pointer in
            var len = socklen_t(MemoryLayout<sockaddr_in>.size)
            if getsockname(socketFileDescriptor, UnsafeMutablePointer(OpaquePointer(pointer)), &len) != 0 {
                throw SocketError.getSockNameFailed(Errno.description())
            }
            let sin_port = pointer.pointee.sin_port
            #if os(Linux)
                return ntohs(sin_port)
            #else
                return Int(OSHostByteOrder()) != OSLittleEndian ? sin_port.littleEndian : sin_port.bigEndian
            #endif
        }
    }

    public func isIPv4() throws -> Bool {
        var addr = sockaddr_in()
        return try withUnsafePointer(to: &addr) { pointer in
            var len = socklen_t(MemoryLayout<sockaddr_in>.size)
            if getsockname(socketFileDescriptor, UnsafeMutablePointer(OpaquePointer(pointer)), &len) != 0 {
                throw SocketError.getSockNameFailed(Errno.description())
            }
            return Int32(pointer.pointee.sin_family) == AF_INET
        }
    }

    public func writeUTF8(_ string: String) throws {
        try writeUInt8(ArraySlice(string.utf8))
    }

    public func writeUInt8(_ data: [UInt8]) throws {
        try writeUInt8(ArraySlice(data))
    }

    public func writeUInt8(_ data: ArraySlice<UInt8>) throws {
        try data.withUnsafeBufferPointer {
            try writeBuffer($0.baseAddress!, length: data.count)
        }
    }

    public func writeData(_ data: NSData) throws {
        try writeBuffer(data.bytes, length: data.length)
    }

    public func writeData(_ data: Data) throws {
        #if compiler(>=5.0)
        try data.withUnsafeBytes { (body: UnsafeRawBufferPointer) -> Void in
            if let baseAddress = body.baseAddress, body.count > 0 {
                let pointer = baseAddress.assumingMemoryBound(to: UInt8.self)
                try self.writeBuffer(pointer, length: data.count)
            }
        }
        #else
        try data.withUnsafeBytes { (pointer: UnsafePointer<UInt8>) -> Void in
            try self.writeBuffer(pointer, length: data.count)
        }
        #endif
    }

    private func writeBuffer(_ pointer: UnsafeRawPointer, length: Int) throws {
        var sent = 0
        while sent < length {
            #if os(Linux)
                let result = send(self.socketFileDescriptor, pointer + sent, Int(length - sent), Int32(MSG_NOSIGNAL))
            #else
                let result = write(self.socketFileDescriptor, pointer + sent, Int(length - sent))
            #endif
            if result <= 0 {
                throw SocketError.writeFailed(Errno.description())
            }
            sent += result
        }
    }

    /// Read a single byte off the socket. This method is optimized for reading
    /// a single byte. For reading multiple bytes, use read(length:), which will
    /// pre-allocate heap space and read directly into it.
    ///
    /// - Returns: A single byte
    /// - Throws: SocketError.recvFailed if unable to read from the socket
    open func read() throws -> UInt8 {
        var byte: UInt8 = 0

        #if os(Linux)
        let count = Glibc.read(self.socketFileDescriptor as Int32, &byte, 1)
        #else
        let count = Darwin.read(self.socketFileDescriptor as Int32, &byte, 1)
        #endif

        guard count > 0 else {
            throw SocketError.recvFailed(Errno.description())
        }
        return byte
    }

    /// Read up to `length` bytes from this socket
    ///
    /// - Parameter length: The maximum bytes to read
    /// - Returns: A buffer containing the bytes read
    /// - Throws: SocketError.recvFailed if unable to read bytes from the socket
    open func read(length: Int) throws -> [UInt8] {
        return try [UInt8](unsafeUninitializedCapacity: length) { buffer, bytesRead in
            bytesRead = try read(into: &buffer, length: length)
        }
    }

    static let kBufferLength = 1024

    /// Read up to `length` bytes from this socket into an existing buffer
    ///
    /// - Parameter into: The buffer to read into (must be at least length bytes in size)
    /// - Parameter length: The maximum bytes to read
    /// - Returns: The number of bytes read
    /// - Throws: SocketError.recvFailed if unable to read bytes from the socket
    func read(into buffer: inout UnsafeMutableBufferPointer<UInt8>, length: Int) throws -> Int {
        var offset = 0
        guard let baseAddress = buffer.baseAddress else { return 0 }

        while offset < length {
            // Compute next read length in bytes. The bytes read is never more than kBufferLength at once.
            let readLength = offset + Socket.kBufferLength < length ? Socket.kBufferLength : length - offset

            #if os(Linux)
            let bytesRead = Glibc.read(self.socketFileDescriptor as Int32, baseAddress + offset, readLength)
            #else
            let bytesRead = Darwin.read(self.socketFileDescriptor as Int32, baseAddress + offset, readLength)
            #endif

            guard bytesRead > 0 else {
                throw SocketError.recvFailed(Errno.description())
            }

            offset += bytesRead
        }

        return offset
    }

    private static let CR: UInt8 = 13
    private static let NL: UInt8 = 10

    public func readLine() throws -> String {
        var characters: String = ""
        var index: UInt8 = 0
        repeat {
            index = try self.read()
            if index > Socket.CR { characters.append(Character(UnicodeScalar(index))) }
        } while index != Socket.NL
        return characters
    }

    public func peername() throws -> String {
        var addr = sockaddr(), len: socklen_t = socklen_t(MemoryLayout<sockaddr>.size)
        if getpeername(self.socketFileDescriptor, &addr, &len) != 0 {
            throw SocketError.getPeerNameFailed(Errno.description())
        }
        var hostBuffer = [CChar](repeating: 0, count: Int(NI_MAXHOST))
        if getnameinfo(&addr, len, &hostBuffer, socklen_t(hostBuffer.count), nil, 0, NI_NUMERICHOST) != 0 {
            throw SocketError.getNameInfoFailed(Errno.description())
        }
        return String(cString: hostBuffer)
    }

    public class func setNoSigPipe(_ socket: Int32) {
        #if os(Linux)
            // There is no SO_NOSIGPIPE in Linux (nor some other systems). You can instead use the MSG_NOSIGNAL flag when calling send(),
            // or use signal(SIGPIPE, SIG_IGN) to make your entire application ignore SIGPIPE.
        #else
            // Prevents crashes when blocking calls are pending and the app is paused ( via Home button ).
            var no_sig_pipe: Int32 = 1
            setsockopt(socket, SOL_SOCKET, SO_NOSIGPIPE, &no_sig_pipe, socklen_t(MemoryLayout<Int32>.size))
        #endif
    }

    public class func close(_ socket: Int32) {
        #if os(Linux)
            _ = Glibc.close(socket)
        #else
            _ = Darwin.close(socket)
        #endif
    }
}

public func == (socket1: Socket, socket2: Socket) -> Bool {
    return socket1.socketFileDescriptor == socket2.socketFileDescriptor
}




/*
 
 https://github.com/httpswift/swifter/blob/stable/Xcode/Sources/HttpResponse.swift
 */

public enum SerializationError: Error {
    case invalidObject
    case notSupported
}

public protocol HttpResponseBodyWriter {
    func write(_ file: String.File) throws
    func write(_ data: [UInt8]) throws
    func write(_ data: ArraySlice<UInt8>) throws
    func write(_ data: NSData) throws
    func write(_ data: Data) throws
}

public enum HttpResponseBody {

    case json(Any)
    case html(String)
    case htmlBody(String)
    case text(String)
    case data(Data, contentType: String? = nil)
    case custom(Any, (Any) throws -> String)

    func content() -> (Int, ((HttpResponseBodyWriter) throws -> Void)?) {
        do {
            switch self {
            case .json(let object):
              guard JSONSerialization.isValidJSONObject(object) else {
                throw SerializationError.invalidObject
              }
              let data = try JSONSerialization.data(withJSONObject: object)
              return (data.count, {
                try $0.write(data)
              })
            case .text(let body):
                let data = [UInt8](body.utf8)
                return (data.count, {
                    try $0.write(data)
                })
            case .html(let html):
                let data = [UInt8](html.utf8)
                return (data.count, {
                    try $0.write(data)
                })
            case .htmlBody(let body):
                let serialized = "<html><meta charset=\"UTF-8\"><body>\(body)</body></html>"
                let data = [UInt8](serialized.utf8)
                return (data.count, {
                    try $0.write(data)
                })
            case .data(let data, _):
                return (data.count, {
                    try $0.write(data)
                })
            case .custom(let object, let closure):
                let serialized = try closure(object)
                let data = [UInt8](serialized.utf8)
                return (data.count, {
                    try $0.write(data)
                })
            }
        } catch {
            let data = [UInt8]("Serialization error: \(error)".utf8)
            return (data.count, {
                try $0.write(data)
            })
        }
    }
}

// swiftlint:disable cyclomatic_complexity
public enum HttpResponse {

    case switchProtocols([String: String], (Socket) -> Void)
    case ok(HttpResponseBody, [String: String] = [:]), created, accepted
    case movedPermanently(String)
    case movedTemporarily(String)
    case badRequest(HttpResponseBody?), unauthorized(HttpResponseBody?), forbidden(HttpResponseBody?), notFound(HttpResponseBody? = nil), notAcceptable(HttpResponseBody?), tooManyRequests(HttpResponseBody?), internalServerError(HttpResponseBody?)
    case raw(Int, String, [String: String]?, ((HttpResponseBodyWriter) throws -> Void)? )

    public var statusCode: Int {
        switch self {
        case .switchProtocols         : return 101
        case .ok                      : return 200
        case .created                 : return 201
        case .accepted                : return 202
        case .movedPermanently        : return 301
        case .movedTemporarily        : return 307
        case .badRequest              : return 400
        case .unauthorized            : return 401
        case .forbidden               : return 403
        case .notFound                : return 404
        case .notAcceptable           : return 406
        case .tooManyRequests         : return 429
        case .internalServerError     : return 500
        case .raw(let code, _, _, _)  : return code
        }
    }

    public var reasonPhrase: String {
        switch self {
        case .switchProtocols          : return "Switching Protocols"
        case .ok                       : return "OK"
        case .created                  : return "Created"
        case .accepted                 : return "Accepted"
        case .movedPermanently         : return "Moved Permanently"
        case .movedTemporarily         : return "Moved Temporarily"
        case .badRequest               : return "Bad Request"
        case .unauthorized             : return "Unauthorized"
        case .forbidden                : return "Forbidden"
        case .notFound                 : return "Not Found"
        case .notAcceptable            : return "Not Acceptable"
        case .tooManyRequests          : return "Too Many Requests"
        case .internalServerError      : return "Internal Server Error"
        case .raw(_, let phrase, _, _) : return phrase
        }
    }

    public func headers() -> [String: String] {
        var headers = ["Server": "Swifter \(HttpServer.VERSION)"]
        switch self {
        case .switchProtocols(let switchHeaders, _):
            for (key, value) in switchHeaders {
                headers[key] = value
            }
        case .ok(let body, let customHeaders):
            for (key, value) in customHeaders {
                headers.updateValue(value, forKey: key)
            }
            switch body {
            case .json: headers["Content-Type"] = "application/json"
            case .html, .htmlBody: headers["Content-Type"] = "text/html"
            case .text: headers["Content-Type"] = "text/plain"
            case .data(_, let contentType): headers["Content-Type"] = contentType
            default:break
            }
        case .movedPermanently(let location):
            headers["Location"] = location
        case .movedTemporarily(let location):
            headers["Location"] = location
        case .raw(_, _, let rawHeaders, _):
            if let rawHeaders = rawHeaders {
                for (key, value) in rawHeaders {
                    headers.updateValue(value, forKey: key)
                }
            }
        default:break
        }
        return headers
    }

    func content() -> (length: Int, write: ((HttpResponseBodyWriter) throws -> Void)?) {
        switch self {
        case .ok(let body, _)          : return body.content()
        case .badRequest(let body), .unauthorized(let body), .forbidden(let body), .notFound(let body), .tooManyRequests(let body), .internalServerError(let body) : return body?.content() ?? (-1, nil)
        case .raw(_, _, _, let writer) : return (-1, writer)
        default                        : return (-1, nil)
        }
    }

    func socketSession() -> ((Socket) -> Void)? {
        switch self {
        case .switchProtocols(_, let handler) : return handler
        default: return nil
        }
    }
}

/**
    Makes it possible to compare handler responses with '==', but
    ignores any associated values. This should generally be what
    you want. E.g.:
    let resp = handler(updatedRequest)
        if resp == .NotFound {
        print("Client requested not found: \(request.url)")
    }
*/

func == (inLeft: HttpResponse, inRight: HttpResponse) -> Bool {
    return inLeft.statusCode == inRight.statusCode
}



/*
 
 https://github.com/httpswift/swifter/blob/stable/Xcode/Sources/String%2BMisc.swift
 */




extension String {

    public func unquote() -> String {
        var scalars = self.unicodeScalars
        if scalars.first == "\"" && scalars.last == "\"" && scalars.count >= 2 {
            scalars.removeFirst()
            scalars.removeLast()
            return String(scalars)
        }
        return self
    }
}

extension UnicodeScalar {

    public func asWhitespace() -> UInt8? {
        if self.value >= 9 && self.value <= 13 {
            return UInt8(self.value)
        }
        if self.value == 32 {
            return UInt8(self.value)
        }
        return nil
    }
}



/*
 
 https://github.com/httpswift/swifter/blob/stable/Xcode/Sources/HttpRequest.swift
 */


public class HttpRequest {

    public var path: String = ""
    public var queryParams: [(String, String)] = []
    public var method: String = ""
    public var headers: [String: String] = [:]
    public var body: [UInt8] = []
    public var address: String? = ""
    public var params: [String: String] = [:]

    public init() {}

    public func hasTokenForHeader(_ headerName: String, token: String) -> Bool {
        guard let headerValue = headers[headerName] else {
            return false
        }
        return headerValue.components(separatedBy: ",").filter({ $0.trimmingCharacters(in: .whitespaces).lowercased() == token }).count > 0
    }

    public func parseUrlencodedForm() -> [(String, String)] {
        guard let contentTypeHeader = headers["content-type"] else {
            return []
        }
        let contentTypeHeaderTokens = contentTypeHeader.components(separatedBy: ";").map { $0.trimmingCharacters(in: .whitespaces) }
        guard let contentType = contentTypeHeaderTokens.first, contentType == "application/x-www-form-urlencoded" else {
            return []
        }
        guard let utf8String = String(bytes: body, encoding: .utf8) else {
            // Consider to throw an exception here (examine the encoding from headers).
            return []
        }
        return utf8String.components(separatedBy: "&").map { param -> (String, String) in
            let tokens = param.components(separatedBy: "=")
            if let name = tokens.first?.removingPercentEncoding, let value = tokens.last?.removingPercentEncoding, tokens.count == 2 {
                return (name.replacingOccurrences(of: "+", with: " "),
                        value.replacingOccurrences(of: "+", with: " "))
            }
            return ("", "")
        }
    }

    public struct MultiPart {

        public let headers: [String: String]
        public let body: [UInt8]

        public var name: String? {
            return valueFor("content-disposition", parameter: "name")?.unquote()
        }

        public var fileName: String? {
            return valueFor("content-disposition", parameter: "filename")?.unquote()
        }

        private func valueFor(_ headerName: String, parameter: String) -> String? {
            return headers.reduce([String]()) { (combined, header: (key: String, value: String)) -> [String] in
                guard header.key == headerName else {
                    return combined
                }
                let headerValueParams = header.value.components(separatedBy: ";").map { $0.trimmingCharacters(in: .whitespaces) }
                return headerValueParams.reduce(combined, { (results, token) -> [String] in
                    let parameterTokens = token.components(separatedBy: "=")
                    if parameterTokens.first == parameter, let value = parameterTokens.last {
                        return results + [value]
                    }
                    return results
                })
                }.first
        }
    }

    public func parseMultiPartFormData() -> [MultiPart] {
        guard let contentTypeHeader = headers["content-type"] else {
            return []
        }
        let contentTypeHeaderTokens = contentTypeHeader.components(separatedBy: ";").map { $0.trimmingCharacters(in: .whitespaces) }
        guard let contentType = contentTypeHeaderTokens.first, contentType == "multipart/form-data" else {
            return []
        }
        var boundary: String?
        contentTypeHeaderTokens.forEach({
            let tokens = $0.components(separatedBy: "=")
            if let key = tokens.first, key == "boundary" && tokens.count == 2 {
                boundary = tokens.last
            }
        })
        if let boundary = boundary, boundary.utf8.count > 0 {
            return parseMultiPartFormData(body, boundary: "--\(boundary)")
        }
        return []
    }

    private func parseMultiPartFormData(_ data: [UInt8], boundary: String) -> [MultiPart] {
        var generator = data.makeIterator()
        var result = [MultiPart]()
        while let part = nextMultiPart(&generator, boundary: boundary, isFirst: result.isEmpty) {
            result.append(part)
        }
        return result
    }

    private func nextMultiPart(_ generator: inout IndexingIterator<[UInt8]>, boundary: String, isFirst: Bool) -> MultiPart? {
        if isFirst {
            guard nextUTF8MultiPartLine(&generator) == boundary else {
                return nil
            }
        } else {
            let /* ignore */ _ = nextUTF8MultiPartLine(&generator)
        }
        var headers = [String: String]()
        while let line = nextUTF8MultiPartLine(&generator), !line.isEmpty {
            let tokens = line.components(separatedBy: ":")
            if let name = tokens.first, let value = tokens.last, tokens.count == 2 {
                headers[name.lowercased()] = value.trimmingCharacters(in: .whitespaces)
            }
        }
        guard let body = nextMultiPartBody(&generator, boundary: boundary) else {
            return nil
        }
        return MultiPart(headers: headers, body: body)
    }

    private func nextUTF8MultiPartLine(_ generator: inout IndexingIterator<[UInt8]>) -> String? {
        var temp = [UInt8]()
        while let value = generator.next() {
            if value > HttpRequest.CR {
                temp.append(value)
            }
            if value == HttpRequest.NL {
                break
            }
        }
        return String(bytes: temp, encoding: String.Encoding.utf8)
    }

    // swiftlint:disable identifier_name
    static let CR = UInt8(13)
    static let NL = UInt8(10)

    private func nextMultiPartBody(_ generator: inout IndexingIterator<[UInt8]>, boundary: String) -> [UInt8]? {
        var body = [UInt8]()
        let boundaryArray = [UInt8](boundary.utf8)
        var matchOffset = 0
        while let x = generator.next() {
            matchOffset = ( x == boundaryArray[matchOffset] ? matchOffset + 1 : 0 )
            body.append(x)
            if matchOffset == boundaryArray.count {
                #if swift(>=4.2)
                body.removeSubrange(body.count-matchOffset ..< body.count)
                #else
                body.removeSubrange(CountableRange<Int>(body.count-matchOffset ..< body.count))
                #endif
                if body.last == HttpRequest.NL {
                    body.removeLast()
                    if body.last == HttpRequest.CR {
                        body.removeLast()
                    }
                }
                return body
            }
        }
        return nil
    }
}


/*
 
 https://github.com/httpswift/swifter/blob/stable/Xcode/Sources/HttpRouter.swift
 */

open class HttpRouter {

    public init() {}

    private class Node {

        /// The children nodes that form the route
        var nodes = [String: Node]()

        /// Define whether or not this node is the end of a route
        var isEndOfRoute: Bool = false

        /// The closure to handle the route
        var handler: ((HttpRequest) -> HttpResponse)?
    }

    private var rootNode = Node()

    /// The Queue to handle the thread safe access to the routes
    private let queue = DispatchQueue(label: "swifter.httpserverio.httprouter")

    public func routes() -> [String] {
        var routes = [String]()
        for (_, child) in rootNode.nodes {
            routes.append(contentsOf: routesForNode(child))
        }
        return routes
    }

    private func routesForNode(_ node: Node, prefix: String = "") -> [String] {
        var result = [String]()
        if node.handler != nil {
            result.append(prefix)
        }
        for (key, child) in node.nodes {
            result.append(contentsOf: routesForNode(child, prefix: prefix + "/" + key))
        }
        return result
    }

    public func register(_ method: String?, path: String, handler: ((HttpRequest) -> HttpResponse)?) {
        var pathSegments = stripQuery(path).split("/")
        if let method = method {
            pathSegments.insert(method, at: 0)
        } else {
            pathSegments.insert("*", at: 0)
        }
        var pathSegmentsGenerator = pathSegments.makeIterator()
        inflate(&rootNode, generator: &pathSegmentsGenerator).handler = handler
    }

    public func route(_ method: String?, path: String) -> ([String: String], (HttpRequest) -> HttpResponse)? {

        return queue.sync {
            if let method = method {
                let pathSegments = (method + "/" + stripQuery(path)).split("/")
                var pathSegmentsGenerator = pathSegments.makeIterator()
                var params = [String: String]()
                if let handler = findHandler(&rootNode, params: &params, generator: &pathSegmentsGenerator) {
                    return (params, handler)
                }
            }

            let pathSegments = ("*/" + stripQuery(path)).split("/")
            var pathSegmentsGenerator = pathSegments.makeIterator()
            var params = [String: String]()
            if let handler = findHandler(&rootNode, params: &params, generator: &pathSegmentsGenerator) {
                return (params, handler)
            }

            return nil
        }
    }

    private func inflate(_ node: inout Node, generator: inout IndexingIterator<[String]>) -> Node {

        var currentNode = node

        while let pathSegment = generator.next() {
            if let nextNode = currentNode.nodes[pathSegment] {
                currentNode = nextNode
            } else {
                currentNode.nodes[pathSegment] = Node()
                currentNode = currentNode.nodes[pathSegment]!
            }
        }

        currentNode.isEndOfRoute = true
        return currentNode
    }

    private func findHandler(_ node: inout Node, params: inout [String: String], generator: inout IndexingIterator<[String]>) -> ((HttpRequest) -> HttpResponse)? {

        var matchedRoutes = [Node]()
        let pattern = generator.map { $0 }
        let numberOfElements = pattern.count

        findHandler(&node, params: &params, pattern: pattern, matchedNodes: &matchedRoutes, index: 0, count: numberOfElements)
        return matchedRoutes.first?.handler
    }

    // swiftlint:disable function_parameter_count
    /// Find the handlers for a specified route
    ///
    /// - Parameters:
    ///   - node: The root node of the tree representing all the routes
    ///   - params: The parameters of the match
    ///   - pattern: The pattern or route to find in the routes tree
    ///   - matchedNodes: An array with the nodes matching the route
    ///   - index: The index of current position in the generator
    ///   - count: The number of elements if the route to match
    private func findHandler(_ node: inout Node, params: inout [String: String], pattern: [String], matchedNodes: inout [Node], index: Int, count: Int) {

        if index < count, let pathToken = pattern[index].removingPercentEncoding {

            var currentIndex = index + 1
            let variableNodes = node.nodes.filter { $0.0.first == ":" }
            if let variableNode = variableNodes.first {
                if currentIndex == count && variableNode.1.isEndOfRoute {
                    // if it's the last element of the pattern and it's a variable, stop the search and
                    // append a tail as a value for the variable.
                    let tail = pattern[currentIndex..<count].joined(separator: "/")
                    if tail.count > 0 {
                        params[variableNode.0] = pathToken + "/" + tail
                    } else {
                        params[variableNode.0] = pathToken
                    }

                    matchedNodes.append(variableNode.value)
                    return
                }
                params[variableNode.0] = pathToken
                findHandler(&node.nodes[variableNode.0]!, params: &params, pattern: pattern, matchedNodes: &matchedNodes, index: currentIndex, count: count)
            }

            if var node = node.nodes[pathToken] {
                findHandler(&node, params: &params, pattern: pattern, matchedNodes: &matchedNodes, index: currentIndex, count: count)
            }

            if var node = node.nodes["*"] {
                findHandler(&node, params: &params, pattern: pattern, matchedNodes: &matchedNodes, index: currentIndex, count: count)
            }

            if let startStarNode = node.nodes["**"] {
                if startStarNode.isEndOfRoute {
                    // ** at the end of a route works as a catch-all
                    matchedNodes.append(startStarNode)
                    return
                }

                let startStarNodeKeys = startStarNode.nodes.keys
                currentIndex += 1
                while currentIndex < count, let pathToken = pattern[currentIndex].removingPercentEncoding {
                    currentIndex += 1
                    if startStarNodeKeys.contains(pathToken) {
                        findHandler(&startStarNode.nodes[pathToken]!, params: &params, pattern: pattern, matchedNodes: &matchedNodes, index: currentIndex, count: count)
                    }
                }
            }
        }

        if node.isEndOfRoute && index == count {
            // if it's the last element and the path to match is done then it's a pattern matching
            matchedNodes.append(node)
            return
        }
    }

    private func stripQuery(_ path: String) -> String {
        if let path = path.components(separatedBy: "?").first {
            return path
        }
        return path
    }
}

extension String {

    func split(_ separator: Character) -> [String] {
        return self.split { $0 == separator }.map(String.init)
    }

}

/*
 
 https://github.com/httpswift/swifter/blob/stable/Xcode/Sources/HttpParser.swift
 */


enum HttpParserError: Error, Equatable {
    case invalidStatusLine(String)
    case negativeContentLength
}

public class HttpParser {

    public init() { }

    public func readHttpRequest(_ socket: Socket) throws -> HttpRequest {
        let statusLine = try socket.readLine()
        let statusLineTokens = statusLine.components(separatedBy: " ")
        if statusLineTokens.count < 3 {
            throw HttpParserError.invalidStatusLine(statusLine)
        }
        let request = HttpRequest()
        request.method = statusLineTokens[0]
        let encodedPath = statusLineTokens[1].addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? statusLineTokens[1]
        let urlComponents = URLComponents(string: encodedPath)
        request.path = urlComponents?.path ?? ""
        request.queryParams = urlComponents?.queryItems?.map { ($0.name, $0.value ?? "") } ?? []
        request.headers = try readHeaders(socket)
        if let contentLength = request.headers["content-length"], let contentLengthValue = Int(contentLength) {
            // Prevent a buffer overflow and runtime error trying to create an `UnsafeMutableBufferPointer` with
            // a negative length
            guard contentLengthValue >= 0 else {
                throw HttpParserError.negativeContentLength
            }
            request.body = try readBody(socket, size: contentLengthValue)
        }
        return request
        }

    private func readBody(_ socket: Socket, size: Int) throws -> [UInt8] {
        return try socket.read(length: size)
    }

    private func readHeaders(_ socket: Socket) throws -> [String: String] {
        var headers = [String: String]()
        while case let headerLine = try socket.readLine(), !headerLine.isEmpty {
            let headerTokens = headerLine.split(separator: ":", maxSplits: 1, omittingEmptySubsequences: true).map(String.init)
            if let name = headerTokens.first, let value = headerTokens.last {
                headers[name.lowercased()] = value.trimmingCharacters(in: .whitespaces)
            }
        }
        return headers
    }

    func supportsKeepAlive(_ headers: [String: String]) -> Bool {
        if let value = headers["connection"] {
            return "keep-alive" == value.trimmingCharacters(in: .whitespaces)
        }
        return false
    }
}


/*
 
 https://github.com/httpswift/swifter/blob/stable/Xcode/Sources/Socket%2BServer.swift
 */




extension Socket {

    // swiftlint:disable function_body_length
    /// - Parameters:
    ///   - listenAddress: String representation of the address the socket should accept
    ///       connections from. It should be in IPv4 format if forceIPv4 == true,
    ///       otherwise - in IPv6.
    public class func tcpSocketForListen(_ port: in_port_t, _ forceIPv4: Bool = false, _ maxPendingConnection: Int32 = SOMAXCONN, _ listenAddress: String? = nil) throws -> Socket {

        #if os(Linux)
            let socketFileDescriptor = socket(forceIPv4 ? AF_INET : AF_INET6, Int32(SOCK_STREAM.rawValue), 0)
        #else
            let socketFileDescriptor = socket(forceIPv4 ? AF_INET : AF_INET6, SOCK_STREAM, 0)
        #endif

        if socketFileDescriptor == -1 {
            throw SocketError.socketCreationFailed(Errno.description())
        }

        var value: Int32 = 1
        if setsockopt(socketFileDescriptor, SOL_SOCKET, SO_REUSEADDR, &value, socklen_t(MemoryLayout<Int32>.size)) == -1 {
            let details = Errno.description()
            Socket.close(socketFileDescriptor)
            throw SocketError.socketSettingReUseAddrFailed(details)
        }
        Socket.setNoSigPipe(socketFileDescriptor)

        var bindResult: Int32 = -1
        if forceIPv4 {
            #if os(Linux)
            var addr = sockaddr_in(
                sin_family: sa_family_t(AF_INET),
                sin_port: port.bigEndian,
                sin_addr: in_addr(s_addr: in_addr_t(0)),
                sin_zero: (0, 0, 0, 0, 0, 0, 0, 0))
            #else
            var addr = sockaddr_in(
                sin_len: UInt8(MemoryLayout<sockaddr_in>.stride),
                sin_family: UInt8(AF_INET),
                sin_port: port.bigEndian,
                sin_addr: in_addr(s_addr: in_addr_t(0)),
                sin_zero: (0, 0, 0, 0, 0, 0, 0, 0))
            #endif
            if let address = listenAddress {
              if address.withCString({ cstring in inet_pton(AF_INET, cstring, &addr.sin_addr) }) == 1 {
                // print("\(address) is converted to \(addr.sin_addr).")
              } else {
                // print("\(address) is not converted.")
              }
            }
            bindResult = withUnsafePointer(to: &addr) {
                bind(socketFileDescriptor, UnsafePointer<sockaddr>(OpaquePointer($0)), socklen_t(MemoryLayout<sockaddr_in>.size))
            }
        } else {
            #if os(Linux)
            var addr = sockaddr_in6(
                sin6_family: sa_family_t(AF_INET6),
                sin6_port: port.bigEndian,
                sin6_flowinfo: 0,
                sin6_addr: in6addr_any,
                sin6_scope_id: 0)
            #else
            var addr = sockaddr_in6(
                sin6_len: UInt8(MemoryLayout<sockaddr_in6>.stride),
                sin6_family: UInt8(AF_INET6),
                sin6_port: port.bigEndian,
                sin6_flowinfo: 0,
                sin6_addr: in6addr_any,
                sin6_scope_id: 0)
            #endif
            if let address = listenAddress {
              if address.withCString({ cstring in inet_pton(AF_INET6, cstring, &addr.sin6_addr) }) == 1 {
                //print("\(address) is converted to \(addr.sin6_addr).")
              } else {
                //print("\(address) is not converted.")
              }
            }
            bindResult = withUnsafePointer(to: &addr) {
                bind(socketFileDescriptor, UnsafePointer<sockaddr>(OpaquePointer($0)), socklen_t(MemoryLayout<sockaddr_in6>.size))
            }
        }

        if bindResult == -1 {
            let details = Errno.description()
            Socket.close(socketFileDescriptor)
            throw SocketError.bindFailed(details)
        }

        if listen(socketFileDescriptor, maxPendingConnection) == -1 {
            let details = Errno.description()
            Socket.close(socketFileDescriptor)
            throw SocketError.listenFailed(details)
        }
        return Socket(socketFileDescriptor: socketFileDescriptor)
    }

    public func acceptClientSocket() throws -> Socket {
        var addr = sockaddr()
        var len: socklen_t = 0
        let clientSocket = accept(self.socketFileDescriptor, &addr, &len)
        if clientSocket == -1 {
            throw SocketError.acceptFailed(Errno.description())
        }
        Socket.setNoSigPipe(clientSocket)
        return Socket(socketFileDescriptor: clientSocket)
    }
}

/*
 
 https://github.com/httpswift/swifter/blob/stable/Xcode/Sources/Socket%2BFile.swift
 */




#if os(iOS) || os(tvOS) || os (Linux)
// swiftlint:disable type_name function_parameter_count
    struct sf_hdtr { }

    private func sendfileImpl(_ source: UnsafeMutablePointer<FILE>, _ target: Int32, _: off_t, _: UnsafeMutablePointer<off_t>, _: UnsafeMutablePointer<sf_hdtr>, _: Int32) -> Int32 {
        var buffer = [UInt8](repeating: 0, count: 1024)
        while true {
            let readResult = fread(&buffer, 1, buffer.count, source)
            guard readResult > 0 else {
                return Int32(readResult)
            }
            var writeCounter = 0
            while writeCounter < readResult {
                let writeResult = buffer.withUnsafeBytes { (ptr) -> Int in
                  let start = ptr.baseAddress! + writeCounter
                  let len = readResult - writeCounter
                  #if os(Linux)
                  return send(target, start, len, Int32(MSG_NOSIGNAL))
                  #else
                  return write(target, start, len)
                  #endif
                }
                guard writeResult > 0 else {
                    return Int32(writeResult)
                }
                writeCounter += writeResult
            }
        }
    }
#endif

extension Socket {

    public func writeFile(_ file: String.File) throws {
        var offset: off_t = 0
        var sf: sf_hdtr = sf_hdtr()

        #if os(iOS) || os(tvOS) || os (Linux)
        let result = sendfileImpl(file.pointer, self.socketFileDescriptor, 0, &offset, &sf, 0)
        #else
        let result = sendfile(fileno(file.pointer), self.socketFileDescriptor, 0, &offset, &sf, 0)
        #endif

        if result == -1 {
            throw SocketError.writeFailed("sendfile: " + Errno.description())
        }
    }
}



/*
 
 https://github.com/httpswift/swifter/blob/stable/Xcode/Sources/HttpServerIO.swift
 */
import Dispatch

public protocol HttpServerIODelegate: AnyObject {
    func socketConnectionReceived(_ socket: Socket)
}

open class HttpServerIO {

    public weak var delegate: HttpServerIODelegate?

    private var socket = Socket(socketFileDescriptor: -1)
    private var sockets = Set<Socket>()

    public enum HttpServerIOState: Int32 {
        case starting
        case running
        case stopping
        case stopped
    }

    private var stateValue: Int32 = HttpServerIOState.stopped.rawValue

    public private(set) var state: HttpServerIOState {
        get {
            return HttpServerIOState(rawValue: stateValue)!
        }
        set(state) {
            #if !os(Linux)
            OSAtomicCompareAndSwapInt(self.state.rawValue, state.rawValue, &stateValue)
            #else
            self.stateValue = state.rawValue
            #endif
        }
    }

    public var operating: Bool { return self.state == .running }

    /// String representation of the IPv4 address to receive requests from.
    /// It's only used when the server is started with `forceIPv4` option set to true.
    /// Otherwise, `listenAddressIPv6` will be used.
    public var listenAddressIPv4: String?

    /// String representation of the IPv6 address to receive requests from.
    /// It's only used when the server is started with `forceIPv4` option set to false.
    /// Otherwise, `listenAddressIPv4` will be used.
    public var listenAddressIPv6: String?

    private let queue = DispatchQueue(label: "swifter.httpserverio.clientsockets")

    public func port() throws -> Int {
        return Int(try socket.port())
    }

    public func isIPv4() throws -> Bool {
        return try socket.isIPv4()
    }

    deinit {
        stop()
    }

    @available(macOS 10.10, *)
    public func start(_ port: in_port_t = 8080, forceIPv4: Bool = false, priority: DispatchQoS.QoSClass = DispatchQoS.QoSClass.background) throws {
        guard !self.operating else { return }
        stop()
        self.state = .starting
        let address = forceIPv4 ? listenAddressIPv4 : listenAddressIPv6
        self.socket = try Socket.tcpSocketForListen(port, forceIPv4, SOMAXCONN, address)
        self.state = .running
        DispatchQueue.global(qos: priority).async { [weak self] in
            guard let strongSelf = self else { return }
            guard strongSelf.operating else { return }
            while let socket = try? strongSelf.socket.acceptClientSocket() {
                DispatchQueue.global(qos: priority).async { [weak self] in
                    guard let strongSelf = self else { return }
                    guard strongSelf.operating else { return }
                    strongSelf.queue.async {
                        strongSelf.sockets.insert(socket)
                    }

                    strongSelf.handleConnection(socket)

                    strongSelf.queue.async {
                        strongSelf.sockets.remove(socket)
                    }
                }
            }
            strongSelf.stop()
        }
    }

    public func stop() {
        guard self.operating else { return }
        self.state = .stopping
        // Shutdown connected peers because they can live in 'keep-alive' or 'websocket' loops.
        for socket in self.sockets {
            socket.close()
        }
        self.queue.sync {
            self.sockets.removeAll(keepingCapacity: true)
        }
        socket.close()
        self.state = .stopped
    }

    open func dispatch(_ request: HttpRequest) -> ([String: String], (HttpRequest) -> HttpResponse) {
        return ([:], { _ in HttpResponse.notFound(nil) })
    }

    private func handleConnection(_ socket: Socket) {
        let parser = HttpParser()
        while self.operating, let request = try? parser.readHttpRequest(socket) {
            let request = request
            request.address = try? socket.peername()
            let (params, handler) = self.dispatch(request)
            request.params = params
            let response = handler(request)
            var keepConnection = parser.supportsKeepAlive(request.headers)
            do {
                if self.operating {
                    keepConnection = try self.respond(socket, response: response, keepAlive: keepConnection)
                }
            } catch {
                print("Failed to send response: \(error)")
            }
            if let session = response.socketSession() {
                delegate?.socketConnectionReceived(socket)
                session(socket)
                break
            }
            if !keepConnection { break }
        }
        socket.close()
    }

    private struct InnerWriteContext: HttpResponseBodyWriter {

        let socket: Socket

        func write(_ file: String.File) throws {
            try socket.writeFile(file)
        }

        func write(_ data: [UInt8]) throws {
            try write(ArraySlice(data))
        }

        func write(_ data: ArraySlice<UInt8>) throws {
            try socket.writeUInt8(data)
        }

        func write(_ data: NSData) throws {
            try socket.writeData(data)
        }

        func write(_ data: Data) throws {
            try socket.writeData(data)
        }
    }

    private func respond(_ socket: Socket, response: HttpResponse, keepAlive: Bool) throws -> Bool {
        guard self.operating else { return false }

        // Some web-socket clients (like Jetfire) expects to have header section in a single packet.
        // We can't promise that but make sure we invoke "write" only once for response header section.
        var responseHeader = String()

        responseHeader.append("HTTP/1.1 \(response.statusCode) \(response.reasonPhrase)\r\n")

        let content = response.content()

        if content.length >= 0 {
            responseHeader.append("Content-Length: \(content.length)\r\n")
        }

        if keepAlive && content.length != -1 {
            responseHeader.append("Connection: keep-alive\r\n")
        }

        for (name, value) in response.headers() {
            responseHeader.append("\(name): \(value)\r\n")
        }

        responseHeader.append("\r\n")

        try socket.writeUTF8(responseHeader)

        if let writeClosure = content.write {
            let context = InnerWriteContext(socket: socket)
            try writeClosure(context)
        }

        return keepAlive && content.length != -1
    }
}




/*
 https://github.com/httpswift/swifter/blob/stable/Xcode/Sources/HttpServer.swift
 */

open class HttpServer: HttpServerIO {

    public static let VERSION: String = {

        #if os(Linux)
        return "1.5.0"
        #else
        let bundle = Bundle(for: HttpServer.self)
        guard let version = bundle.infoDictionary?["CFBundleShortVersionString"] as? String else { return "Unspecified" }
        return version
        #endif
    }()

    private let router = HttpRouter()

    public override init() {
        self.DELETE = MethodRoute(method: "DELETE", router: router)
        self.PATCH  = MethodRoute(method: "PATCH", router: router)
        self.HEAD   = MethodRoute(method: "HEAD", router: router)
        self.POST   = MethodRoute(method: "POST", router: router)
        self.GET    = MethodRoute(method: "GET", router: router)
        self.PUT    = MethodRoute(method: "PUT", router: router)

        self.delete = MethodRoute(method: "DELETE", router: router)
        self.patch  = MethodRoute(method: "PATCH", router: router)
        self.head   = MethodRoute(method: "HEAD", router: router)
        self.post   = MethodRoute(method: "POST", router: router)
        self.get    = MethodRoute(method: "GET", router: router)
        self.put    = MethodRoute(method: "PUT", router: router)
    }

    public var DELETE, PATCH, HEAD, POST, GET, PUT: MethodRoute
    public var delete, patch, head, post, get, put: MethodRoute

    public subscript(path: String) -> ((HttpRequest) -> HttpResponse)? {
        get { return nil }
        set {
            router.register(nil, path: path, handler: newValue)
        }
    }

    public var routes: [String] {
        return router.routes()
    }

    public var notFoundHandler: ((HttpRequest) -> HttpResponse)?

    public var middleware = [(HttpRequest) -> HttpResponse?]()

    override open func dispatch(_ request: HttpRequest) -> ([String: String], (HttpRequest) -> HttpResponse) {
        for layer in middleware {
            if let response = layer(request) {
                return ([:], { _ in response })
            }
        }
        if let result = router.route(request.method, path: request.path) {
            return result
        }
        if let notFoundHandler = self.notFoundHandler {
            return ([:], notFoundHandler)
        }
        return super.dispatch(request)
    }

    public struct MethodRoute {
        public let method: String
        public let router: HttpRouter
        public subscript(path: String) -> ((HttpRequest) -> HttpResponse)? {
            get { return nil }
            set {
                router.register(method, path: path, handler: newValue)
            }
        }
    }
}



/*
 
 https://github.com/httpswift/swifter/blob/stable/Xcode/Sources/String%2BBASE64.swift
 */




extension String {

    public static func toBase64(_ data: [UInt8]) -> String {
        return Data(data).base64EncodedString()
    }
}


/*
 
 https://github.com/httpswift/swifter/blob/stable/Xcode/Sources/String%2BSHA1.swift
 */


// swiftlint:disable identifier_name function_body_length
public struct SHA1 {

    public static func hash(_ input: [UInt8]) -> [UInt8] {

        // Alghorithm from: https://en.wikipedia.org/wiki/SHA-1
        var message = input

        var h0 = UInt32(littleEndian: 0x67452301)
        var h1 = UInt32(littleEndian: 0xEFCDAB89)
        var h2 = UInt32(littleEndian: 0x98BADCFE)
        var h3 = UInt32(littleEndian: 0x10325476)
        var h4 = UInt32(littleEndian: 0xC3D2E1F0)

        // ml = message length in bits (always a multiple of the number of bits in a character).
        let ml = UInt64(message.count * 8)

        // append the bit '1' to the message e.g. by adding 0x80 if message length is a multiple of 8 bits.
        message.append(0x80)

        // append 0 ≤ k < 512 bits '0', such that the resulting message length in bits is congruent to −64 ≡ 448 (mod 512)
        let padBytesCount = ( message.count + 8 ) % 64

        message.append(contentsOf: [UInt8](repeating: 0, count: 64 - padBytesCount))

        // append ml, in a 64-bit big-endian integer. Thus, the total length is a multiple of 512 bits.
        var mlBigEndian = ml.bigEndian
        withUnsafePointer(to: &mlBigEndian) {
            message.append(contentsOf: Array(UnsafeBufferPointer<UInt8>(start: UnsafePointer(OpaquePointer($0)), count: 8)))
        }

        // Process the message in successive 512-bit chunks ( 64 bytes chunks ):
        for chunkStart in 0..<message.count/64 {
            var words = [UInt32]()
            let chunk = message[chunkStart*64..<chunkStart*64+64]

            // break chunk into sixteen 32-bit big-endian words w[i], 0 ≤ i ≤ 15
            for index in 0...15 {
                let value = chunk.withUnsafeBufferPointer({ UnsafePointer<UInt32>(OpaquePointer($0.baseAddress! + (index*4))).pointee})
                words.append(value.bigEndian)
            }

            // Extend the sixteen 32-bit words into eighty 32-bit words:
            for index in 16...79 {
                let value: UInt32 = ((words[index-3]) ^ (words[index-8]) ^ (words[index-14]) ^ (words[index-16]))
                words.append(rotateLeft(value, 1))
            }

            // Initialize hash value for this chunk:
            var a = h0
            var b = h1
            var c = h2
            var d = h3
            var e = h4

            for i in 0..<80 {
                var f = UInt32(0)
                var k = UInt32(0)
                switch i {
                case 0...19:
                    f = (b & c) | ((~b) & d)
                    k = 0x5A827999
                case 20...39:
                    f = b ^ c ^ d
                    k = 0x6ED9EBA1
                case 40...59:
                    f = (b & c) | (b & d) | (c & d)
                    k = 0x8F1BBCDC
                case 60...79:
                    f = b ^ c ^ d
                    k = 0xCA62C1D6
                default: break
                }
                let temp = (rotateLeft(a, 5) &+ f &+ e &+ k &+ words[i]) & 0xFFFFFFFF
                e = d
                d = c
                c = rotateLeft(b, 30)
                b = a
                a = temp
            }

            // Add this chunk's hash to result so far:
            h0 = ( h0 &+ a ) & 0xFFFFFFFF
            h1 = ( h1 &+ b ) & 0xFFFFFFFF
            h2 = ( h2 &+ c ) & 0xFFFFFFFF
            h3 = ( h3 &+ d ) & 0xFFFFFFFF
            h4 = ( h4 &+ e ) & 0xFFFFFFFF
        }

        // Produce the final hash value (big-endian) as a 160 bit number:
        var digest = [UInt8]()

        [h0, h1, h2, h3, h4].forEach { value in
            var bigEndianVersion = value.bigEndian
            withUnsafePointer(to: &bigEndianVersion) {
                digest.append(contentsOf: Array(UnsafeBufferPointer<UInt8>(start: UnsafePointer(OpaquePointer($0)), count: 4)))
            }
        }

        return digest
    }

    private static func rotateLeft(_ v: UInt32, _ n: UInt32) -> UInt32 {
        return ((v << n) & 0xFFFFFFFF) | (v >> (32 - n))
    }
}

extension String {

    public func sha1() -> [UInt8] {
        return SHA1.hash([UInt8](self.utf8))
    }

    public func sha1() -> String {
        return self.sha1().reduce("") { $0 + String(format: "%02x", $1) }
    }
}



/*
 
 https://github.com/httpswift/swifter/blob/stable/Xcode/Sources/WebSockets.swift
 */




@available(*, deprecated, message: "Use websocket(text:binary:pong:connected:disconnected:) instead.")
public func websocket(_ text: @escaping (WebSocketSession, String) -> Void,
                      _ binary: @escaping (WebSocketSession, [UInt8]) -> Void,
                      _ pong: @escaping (WebSocketSession, [UInt8]) -> Void) -> ((HttpRequest) -> HttpResponse) {
    return websocket(text: text, binary: binary, pong: pong)
}

// swiftlint:disable function_body_length
public func websocket(
    text: ((WebSocketSession, String) -> Void)? = nil,
    binary: ((WebSocketSession, [UInt8]) -> Void)? = nil,
    pong: ((WebSocketSession, [UInt8]) -> Void)? = nil,
    connected: ((WebSocketSession) -> Void)? = nil,
    disconnected: ((WebSocketSession) -> Void)? = nil) -> ((HttpRequest) -> HttpResponse) {
    return { request in
        guard request.hasTokenForHeader("upgrade", token: "websocket") else {
            return .badRequest(.text("Invalid value of 'Upgrade' header: \(request.headers["upgrade"] ?? "unknown")"))
        }
        guard request.hasTokenForHeader("connection", token: "upgrade") else {
            return .badRequest(.text("Invalid value of 'Connection' header: \(request.headers["connection"] ?? "unknown")"))
        }
        guard let secWebSocketKey = request.headers["sec-websocket-key"] else {
            return .badRequest(.text("Invalid value of 'Sec-Websocket-Key' header: \(request.headers["sec-websocket-key"] ?? "unknown")"))
        }
        let protocolSessionClosure: ((Socket) -> Void) = { socket in
            let session = WebSocketSession(socket)
            var fragmentedOpCode = WebSocketSession.OpCode.close
            var payload = [UInt8]() // Used for fragmented frames.
            func handleTextPayload(_ frame: WebSocketSession.Frame) throws {
                if let handleText = text {
                    if frame.fin {
                        if payload.count > 0 {
                            throw WebSocketSession.WsError.protocolError("Continuing fragmented frame cannot have an operation code.")
                        }
                        var textFramePayload = frame.payload.map { Int8(bitPattern: $0) }
                        textFramePayload.append(0)
                        if let text = String(validatingUTF8: textFramePayload) {
                            handleText(session, text)
                        } else {
                            throw WebSocketSession.WsError.invalidUTF8("")
                        }
                    } else {
                        payload.append(contentsOf: frame.payload)
                        fragmentedOpCode = .text
                    }
                }
            }

            func handleBinaryPayload(_ frame: WebSocketSession.Frame) throws {
                if let handleBinary = binary {
                    if frame.fin {
                        if payload.count > 0 {
                            throw WebSocketSession.WsError.protocolError("Continuing fragmented frame cannot have an operation code.")
                        }
                        handleBinary(session, frame.payload)
                    } else {
                        payload.append(contentsOf: frame.payload)
                        fragmentedOpCode = .binary
                    }
                }
            }

            func handleOperationCode(_ frame: WebSocketSession.Frame) throws {
                switch frame.opcode {
                case .continue:
                    // There is no message to continue, failed immediatelly.
                    if fragmentedOpCode == .close {
                        socket.close()
                    }
                    frame.opcode = fragmentedOpCode
                    if frame.fin {
                        payload.append(contentsOf: frame.payload)
                        frame.payload = payload
                        // Clean the buffer.
                        payload = []
                        // Reset the OpCode.
                        fragmentedOpCode = WebSocketSession.OpCode.close
                    }
                    try handleOperationCode(frame)
                case .text:
                    try handleTextPayload(frame)
                case .binary:
                    try handleBinaryPayload(frame)
                case .close:
                    throw WebSocketSession.Control.close
                case .ping:
                    if frame.payload.count > 125 {
                        throw WebSocketSession.WsError.protocolError("Payload gretter than 125 octets.")
                    } else {
                        session.writeFrame(ArraySlice(frame.payload), .pong)
                    }
                case .pong:
                    if let handlePong = pong {
                       handlePong(session, frame.payload)
                    }
                }
            }

            func read() throws {
                while true {
                    let frame = try session.readFrame()
                    try handleOperationCode(frame)
                }
            }

            connected?(session)

            do {
                try read()
            } catch let error {
                switch error {
                case WebSocketSession.Control.close:
                    // Normal close
                    break
                case WebSocketSession.WsError.unknownOpCode:
                    print("Unknown Op Code: \(error)")
                case WebSocketSession.WsError.unMaskedFrame:
                    print("Unmasked frame: \(error)")
                case WebSocketSession.WsError.invalidUTF8:
                    print("Invalid UTF8 character: \(error)")
                case WebSocketSession.WsError.protocolError:
                    print("Protocol error: \(error)")
                default:
                    print("Unkown error \(error)")
                }
                // If an error occurs, send the close handshake.
                session.writeCloseFrame()
            }

            disconnected?(session)
        }
        let secWebSocketAccept = String.toBase64((secWebSocketKey + "258EAFA5-E914-47DA-95CA-C5AB0DC85B11").sha1())
        let headers = ["Upgrade": "WebSocket", "Connection": "Upgrade", "Sec-WebSocket-Accept": secWebSocketAccept]
        return HttpResponse.switchProtocols(headers, protocolSessionClosure)
    }
}

public class WebSocketSession: Hashable, Equatable {

    public enum WsError: Error { case unknownOpCode(String), unMaskedFrame(String), protocolError(String), invalidUTF8(String) }
    public enum OpCode: UInt8 { case `continue` = 0x00, close = 0x08, ping = 0x09, pong = 0x0A, text = 0x01, binary = 0x02 }
    public enum Control: Error { case close }

    public class Frame {
        public var opcode = OpCode.close
        public var fin = false
        public var rsv1: UInt8 = 0
        public var rsv2: UInt8 = 0
        public var rsv3: UInt8 = 0
        public var payload = [UInt8]()
    }

    public let socket: Socket

    public init(_ socket: Socket) {
        self.socket = socket
    }

    deinit {
        writeCloseFrame()
        socket.close()
    }

    public func writeText(_ text: String) {
        self.writeFrame(ArraySlice(text.utf8), OpCode.text)
    }

    public func writeBinary(_ binary: [UInt8]) {
        self.writeBinary(ArraySlice(binary))
    }

    public func writeBinary(_ binary: ArraySlice<UInt8>) {
        self.writeFrame(binary, OpCode.binary)
    }

    public func writeFrame(_ data: ArraySlice<UInt8>, _ op: OpCode, _ fin: Bool = true) {
        let finAndOpCode = UInt8(fin ? 0x80 : 0x00) | op.rawValue
        let maskAndLngth = encodeLengthAndMaskFlag(UInt64(data.count), false)
        do {
            try self.socket.writeUInt8([finAndOpCode])
            try self.socket.writeUInt8(maskAndLngth)
            try self.socket.writeUInt8(data)
        } catch {
            print(error)
        }
    }

    public func writeCloseFrame() {
        writeFrame(ArraySlice("".utf8), .close)
    }

    private func encodeLengthAndMaskFlag(_ len: UInt64, _ masked: Bool) -> [UInt8] {
        let encodedLngth = UInt8(masked ? 0x80 : 0x00)
        var encodedBytes = [UInt8]()
        switch len {
        case 0...125:
            encodedBytes.append(encodedLngth | UInt8(len))
        case 126...UInt64(UINT16_MAX):
            encodedBytes.append(encodedLngth | 0x7E)
            encodedBytes.append(UInt8(len >> 8 & 0xFF))
            encodedBytes.append(UInt8(len >> 0 & 0xFF))
        default:
            encodedBytes.append(encodedLngth | 0x7F)
            encodedBytes.append(UInt8(len >> 56 & 0xFF))
            encodedBytes.append(UInt8(len >> 48 & 0xFF))
            encodedBytes.append(UInt8(len >> 40 & 0xFF))
            encodedBytes.append(UInt8(len >> 32 & 0xFF))
            encodedBytes.append(UInt8(len >> 24 & 0xFF))
            encodedBytes.append(UInt8(len >> 16 & 0xFF))
            encodedBytes.append(UInt8(len >> 08 & 0xFF))
            encodedBytes.append(UInt8(len >> 00 & 0xFF))
        }
        return encodedBytes
    }

    // swiftlint:disable function_body_length
    public func readFrame() throws -> Frame {
        let frm = Frame()
        let fst = try socket.read()
        frm.fin = fst & 0x80 != 0
        frm.rsv1 = fst & 0x40
        frm.rsv2 = fst & 0x20
        frm.rsv3 = fst & 0x10
        guard frm.rsv1 == 0 && frm.rsv2 == 0 && frm.rsv3 == 0
            else {
            throw WsError.protocolError("Reserved frame bit has not been negociated.")
        }
        let opc = fst & 0x0F
        guard let opcode = OpCode(rawValue: opc) else {
            // "If an unknown opcode is received, the receiving endpoint MUST _Fail the WebSocket Connection_."
            // http://tools.ietf.org/html/rfc6455#section-5.2 ( Page 29 )
            throw WsError.unknownOpCode("\(opc)")
        }
        if frm.fin == false {
            switch opcode {
            case .ping, .pong, .close:
                // Control frames must not be fragmented
                // https://tools.ietf.org/html/rfc6455#section-5.5 ( Page 35 )
                throw WsError.protocolError("Control frames must not be fragmented.")
            default:
                break
            }
        }
        frm.opcode = opcode
        let sec = try socket.read()
        let msk = sec & 0x80 != 0
        guard msk else {
            // "...a client MUST mask all frames that it sends to the server."
            // http://tools.ietf.org/html/rfc6455#section-5.1
            throw WsError.unMaskedFrame("A client must mask all frames that it sends to the server.")
        }
        var len = UInt64(sec & 0x7F)
        if len == 0x7E {
            let b0 = UInt64(try socket.read()) << 8
            let b1 = UInt64(try socket.read())
            len = UInt64(littleEndian: b0 | b1)
        } else if len == 0x7F {
            let b0 = UInt64(try socket.read()) << 54
            let b1 = UInt64(try socket.read()) << 48
            let b2 = UInt64(try socket.read()) << 40
            let b3 = UInt64(try socket.read()) << 32
            let b4 = UInt64(try socket.read()) << 24
            let b5 = UInt64(try socket.read()) << 16
            let b6 = UInt64(try socket.read()) << 8
            let b7 = UInt64(try socket.read())
            len = UInt64(littleEndian: b0 | b1 | b2 | b3 | b4 | b5 | b6 | b7)
        }

        let mask = [try socket.read(), try socket.read(), try socket.read(), try socket.read()]
        // Read payload all at once, then apply mask (calling `socket.read` byte-by-byte is super slow).
        frm.payload = try socket.read(length: Int(len))
        for index in 0..<len {
            frm.payload[Int(index)] ^= mask[Int(index % 4)]
        }
        return frm
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(socket)
    }
}

public func == (webSocketSession1: WebSocketSession, webSocketSession2: WebSocketSession) -> Bool {
    return webSocketSession1.socket == webSocketSession2.socket
}



//
//  DemoServer.swift
//  Swifter
//
//  Copyright (c) 2014-2016 Damian Kołakowski. All rights reserved.
//

/*
 
 https://github.com/httpswift/swifter/blob/stable/Xcode/Sources/DemoServer.swift
 */

// swiftlint:disable function_body_length
public func demoServer(_ publicDir: String) -> HttpServer {

    print(publicDir)

    let server = HttpServer()

    server["/public/:path"] = shareFilesFromDirectory(publicDir)

    server["/files/:path"] = directoryBrowser("/")

    server["/"] = scopes {
        html {
            body {
                ul(server.routes) { service in
                    li {
                        a { href = service; inner = service }
                    }
                }
            }
        }
    }

    server["/magic"] = { .ok(.htmlBody("You asked for " + $0.path), ["XXX-Custom-Header": "value"]) }

    server["/test/:param1/:param2"] = { request in
        scopes {
            html {
                body {
                    h3 { inner = "Address: \(request.address ?? "unknown")" }
                    h3 { inner = "Url: \(request.path)" }
                    h3 { inner = "Method: \(request.method)" }

                    h3 { inner = "Query:" }

                    table(request.queryParams) { param in
                        tr {
                            td { inner = param.0 }
                            td { inner = param.1 }
                        }
                    }

                    h3 { inner = "Headers:" }

                    table(request.headers) { header in
                        tr {
                            td { inner = header.0 }
                            td { inner = header.1 }
                        }
                    }

                    h3 { inner = "Route params:" }

                    table(request.params) { param in
                        tr {
                            td { inner = param.0 }
                            td { inner = param.1 }
                        }
                    }
                }
            }
        }(request)
    }

    server.GET["/upload"] = scopes {
        html {
            body {
                form {
                    method = "POST"
                    action = "/upload"
                    enctype = "multipart/form-data"

                    input { name = "my_file1"; type = "file" }
                    input { name = "my_file2"; type = "file" }
                    input { name = "my_file3"; type = "file" }

                    button {
                        type = "submit"
                        inner = "Upload"
                    }
                }
            }
        }
    }

    server.POST["/upload"] = { request in
        var response = ""
        for multipart in request.parseMultiPartFormData() {
            guard let name = multipart.name, let fileName = multipart.fileName else { continue }
            response += "Name: \(name) File name: \(fileName) Size: \(multipart.body.count)<br>"
        }
        return HttpResponse.ok(.htmlBody(response), ["XXX-Custom-Header": "value"])
    }

    server.GET["/login"] = scopes {
        html {
            head {
                script { src = "http://cdn.staticfile.org/jquery/2.1.4/jquery.min.js" }
                stylesheet { href = "http://cdn.staticfile.org/twitter-bootstrap/3.3.0/css/bootstrap.min.css" }
            }
            body {
                h3 { inner = "Sign In" }

                form {
                    method = "POST"
                    action = "/login"

                    fieldset {
                        input { placeholder = "E-mail"; name = "email"; type = "email"; autofocus = "" }
                        input { placeholder = "Password"; name = "password"; type = "password"; autofocus = "" }
                        a {
                            href = "/login"
                            button {
                                type = "submit"
                                inner = "Login"
                            }
                        }
                    }

                }
                javascript {
                    src = "http://cdn.staticfile.org/twitter-bootstrap/3.3.0/js/bootstrap.min.js"
                }
            }
        }
    }

    server.POST["/login"] = { request in
        let formFields = request.parseUrlencodedForm()
        return HttpResponse.ok(.htmlBody(formFields.map({ "\($0.0) = \($0.1)" }).joined(separator: "<br>")), ["XXX-Custom-Header": "value"])
    }

    server["/demo"] = scopes {
        html {
            body {
                center {
                    h2 { inner = "Hello Swift" }
                    img { src = "https://devimages.apple.com.edgekey.net/swift/images/swift-hero_2x.png" }
                }
            }
        }
    }

    server["/raw"] = { _ in
        return HttpResponse.raw(200, "OK", ["XXX-Custom-Header": "value"], { try $0.write([UInt8]("test".utf8)) })
    }

    server["/redirect/permanently"] = { _ in
        return .movedPermanently("http://www.google.com")
    }

    server["/redirect/temporarily"] = { _ in
        return .movedTemporarily("http://www.google.com")
    }

    server["/long"] = { _ in
        var longResponse = ""
        for index in 0..<1000 { longResponse += "(\(index)),->" }
        return .ok(.htmlBody(longResponse), ["XXX-Custom-Header": "value"])
    }

    server["/wildcard/*/test/*/:param"] = { request in
        return .ok(.htmlBody(request.path), ["XXX-Custom-Header": "value"])
    }

    server["/stream"] = { _ in
        return HttpResponse.raw(200, "OK", nil, { writer in
            for index in 0...100 {
                try writer.write([UInt8]("[chunk \(index)]".utf8))
            }
        })
    }

    server["/websocket-echo"] = websocket(text: { (session, text) in
        session.writeText(text)
    }, binary: { (session, binary) in
        session.writeBinary(binary)
    }, pong: { (_, _) in
        // Got a pong frame
    }, connected: { _ in
        // New client connected
    }, disconnected: { _ in
        // Client disconnected
    })

    server.notFoundHandler = { _ in
        return .movedPermanently("https://github.com/404")
    }

    server.middleware.append { request in
        print("Middleware: \(request.address ?? "unknown address") -> \(request.method) -> \(request.path)")
        return nil
    }

    return server
}


/*
 
 #########################################################################################
 
 */

// import SwiftNIO
// import Cocoa


// import NIO
// import NIOHTTP1
// import NIOWebSocket

/*
 
 https://github.com/appspector/URLSessionWebSocketTask/blob/master/WSServer/Sources/WSServer/main.swift
 
 */

/*
class WebSocketHandler : ChannelInboundHandler {
    
    typealias InboundIn   = WebSocketFrame
    typealias OutboundOut = WebSocketFrame
    
    private var awaitingClose: Bool = false
    
    func channelRead(ctx: ChannelHandlerContext, data: NIOAny) {
        let frame = unwrapInboundIn(data)
        
        switch frame.opcode {
        case .connectionClose:
            self.receivedClose(ctx: ctx, frame: frame)
        case .ping:
            self.pong(ctx: ctx, frame: frame)
        case .text:
            var data = frame.unmaskedData
            let payload = data.readString(length: data.readableBytes) ?? ""
            handlePayload(ctx: ctx, payload: payload)
        default:
            return
        }
    }
    
    func handlePayload(ctx: ChannelHandlerContext, payload: String) {
        var buffer = ctx.channel.allocator.buffer(capacity: payload.utf8.count)
        buffer.write(string: payload)
        
        let frame = WebSocketFrame(fin: true, opcode: .text, data: buffer)
        
        _ = ctx.channel.writeAndFlush(frame)
    }
    
    func channelReadComplete(ctx: ChannelHandlerContext) {
        ctx.flush()
    }
    
    func channelActive(ctx: ChannelHandlerContext) {
        print("Channel ready, client address:", ctx.channel.remoteAddress?.description ?? "-")
    }
    
    func channelInactive(ctx: ChannelHandlerContext) {
        print("Channel closed.", ObjectIdentifier(self))
    }
    
    func errorCaught(ctx: ChannelHandlerContext, error: Error) {
        print("ERROR:", error)
        ctx.close(promise: nil)
    }
    
    private func pong(ctx: ChannelHandlerContext, frame: WebSocketFrame) {
        var frameData = frame.data
        let maskingKey = frame.maskKey
        
        if let maskingKey = maskingKey {
            frameData.webSocketUnmask(maskingKey)
        }
        
        let responseFrame = WebSocketFrame(fin: true, opcode: .pong, data: frameData)
        ctx.write(self.wrapOutboundOut(responseFrame), promise: nil)
    }
    
    private func receivedClose(ctx: ChannelHandlerContext, frame: WebSocketFrame) {
        // Handle a received close frame. In websockets, we're just going to send the close
        // frame and then close, unless we already sent our own close frame.
        if awaitingClose {
            // Cool, we started the close and were waiting for the user. We're done.
            ctx.close(promise: nil)
        } else {
            // This is an unsolicited close. We're going to send a response frame and
            // then, when we've sent it, close up shop. We should send back the close code the remote
            // peer sent us, unless they didn't send one at all.
            var data = frame.unmaskedData
            let closeDataCode = data.readSlice(length: 2) ?? ctx.channel.allocator.buffer(capacity: 0)
            let closeFrame = WebSocketFrame(fin: true, opcode: .connectionClose, data: closeDataCode)
            _ = ctx.write(self.wrapOutboundOut(closeFrame)).map { () in
                ctx.close(promise: nil)
            }
        }
    }
}

final class Server {
    
    struct Configuration {
        var host           : String?         = nil
        var port           : Int             = 8080
        var backlog        : Int             = 256
        var eventLoopGroup : EventLoopGroup? = nil
    }
    
    let configuration  : Configuration
    let eventLoopGroup : EventLoopGroup
    var serverChannel  : Channel?
    
    init(configuration: Configuration = Configuration()) {
        self.configuration  = configuration
        self.eventLoopGroup = configuration.eventLoopGroup ?? MultiThreadedEventLoopGroup(numberOfThreads: 1)
    }
    
    func listenAndWait() {
        listen()
        
        do {
            try serverChannel?.closeFuture.wait()
        }
        catch {
            print("ERROR: Failed to wait on server:", error)
        }
    }
    
    func listen() {
        
        let bootstrap = makeBootstrap()
        
        do {
            let address : SocketAddress
            
            if let host = configuration.host {
                address = try SocketAddress.newAddressResolving(host: host, port: configuration.port)
            } else {
                var addr = sockaddr_in()
                addr.sin_port = in_port_t(configuration.port).bigEndian
                address = SocketAddress(addr, host: "*")
            }
            
            serverChannel = try bootstrap.bind(to: address).wait()
            
            if let addr = serverChannel?.localAddress {
                print("Server running on:", addr)
            }
            else {
                print("ERROR: server reported no local address?")
            }
        }
        catch let error as NIO.IOError {
            print("ERROR: failed to start server, errno:", error.errnoCode, "\n", error.localizedDescription)
        }
        catch {
            print("ERROR: failed to start server:", type(of:error), error)
        }
    }
    
    func shouldUpgrade(head: HTTPRequestHead) -> HTTPHeaders? {
        if (head.uri.starts(with: "/echo")) {
            return HTTPHeaders()
        }
        
        return nil
    }
    
    func upgradePipelineHandler(channel: Channel, head: HTTPRequestHead) -> NIO.EventLoopFuture<Void> {
        if (head.uri.starts(with: "/echo")) {
            return channel.pipeline.add(handler: WebSocketHandler())
        }
        
        return channel.closeFuture
    }
    
    func makeBootstrap() -> ServerBootstrap {
        let reuseAddrOpt = ChannelOptions.socket(SocketOptionLevel(SOL_SOCKET), SO_REUSEADDR)
        let bootstrap = ServerBootstrap(group: eventLoopGroup)
            .serverChannelOption(ChannelOptions.backlog, value: Int32(configuration.backlog))
            .serverChannelOption(reuseAddrOpt, value: 1)
            .childChannelInitializer { channel in
                let connectionUpgrader = WebSocketUpgrader(shouldUpgrade: self.shouldUpgrade, upgradePipelineHandler: self.upgradePipelineHandler)
                
                let config: HTTPUpgradeConfiguration = (
                    upgraders: [ connectionUpgrader ],
                    completionHandler: { _ in }
                )
                
                return channel.pipeline.configureHTTPServerPipeline(first: true, withPipeliningAssistance: true, withServerUpgrade: config, withErrorHandling: true)
                
            }
            .childChannelOption(ChannelOptions.socket(IPPROTO_TCP, TCP_NODELAY), value: 1)
            .childChannelOption(reuseAddrOpt, value: 1)
            .childChannelOption(ChannelOptions.maxMessagesPerRead, value: 1)
        
        return bootstrap
    }
}


// MARK: - Start and run Server

let server = Server()
server.listenAndWait()

*/


