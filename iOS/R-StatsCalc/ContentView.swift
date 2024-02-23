//
//  ContentView.swift
//  R-StatsCalc
//
//  Created by Luis Acevedo-Arreguin on 8/28/22.
//

import SwiftUI
import WebKit
import Combine


// Notes from R-StatsCalc version 1.1

/*
 This App contains a link to an R console powered by DataCamp as well as an editor with a scrolling keyboard.
 It uses DataCamp server at https://cdn.datacamp.com/datacamp-light-latest.min.js
 These are publically available resources: https://cdn.datacamp.com/dcl-react.js.gz
 For more information go to: https://github.com/datacamp/datacamp-light
*/

    // Notes from jor1k-Linux version 0.1

/*
 
 https://github.com/levskaya/jslinux-deobfuscated
 https://github.com/httpswift/swifter // replacing this server with WKWebview
 
 https://s-macke.github.io/jor1k/demos/main.html?user=d4YFtFurIp&cpu=asm&n=1&relayURL=wss%3A%2F%2Frelay.widgetry.org%2F
 
 */


struct ContentView: View {
    
    // R-StatsCalc version 1.1
    
    @State var text0: String = "# R-StatsCalc - ver: 4.3.3" //      Oh, No! Here we go again!!!"

    @State var consoleBackground: Bool = false // "Dark" or "Light"
    @State var consoleMode: Bool = false // "Console Mode" or "Editor Mode"
    @State var capsLockOn: Bool = false // "capsLock = ON or OFF"
    
    @State var server00 = HttpServer()
    @State var flag1: Bool = false
    @State var flag2: Bool = false

    
    // jor1k-Linux version 0.1
    
  //  @State var text0: String = " " //  Oh, No! Here we go again!!!"
     @State var text822: String = " "
  //   @State var consoleBackground: Bool = false // "Dark" or "Light"
  //   @State var consoleMode: Bool = false // "Console Mode" or "Editor Mode"
  //   @State var capsLockOn: Bool = false // "capsLock = ON or OFF"
    @State var getShell01: Bool = false
    @State var getShell02: Bool = false
    @State var getShell03: Bool = false
    @State var getLinux: Bool = false
    @State var getReadme: Bool = false
    @State var getRplot: Bool = false
    @State var getRonline: Bool = false
    @State var getWebR: Bool = false
    @State var getFile1: Bool = false
    
    @State var plotImage = UIImage()
    
    @ObservedObject var viewModel = ViewModel() // new CODE
    @State var currentLoc: String = ""
    
    var options = ["url=alpine-x86.cfg&mem=192","cpu=riscv64&url=buildroot-riscv64.cfg&mem=256","cpu=riscv64&url=fedora33-riscv.cfg&mem=256"]
    @State var selectedLinux = "" // url=alpine-x86.cfg"
    
    
    let license1 = """

https://github.com/jcubic/jquery.terminal/blob/master/LICENSE

The MIT License (MIT)

Copyright (c) 2011-2023 Jakub T. Jankiewicz

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.


https://github.com/httpswift/swifter/blob/stable/LICENSE

MIT License

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



https://github.com/r-wasm/webr/blob/main/LICENSE.md

# Software Licensing

The following external software is included either directly as part of this repo, or downloaded while building the webR binary. The below links can be used to find copies of their respective source code and the licensing text contained within.

 * [R](https://www.r-project.org) - GNU GPL Version 2 & GNU GPL Version 3
 * [PCRE2](https://github.com/PCRE2Project/pcre2) - BSD Licence
 * [XZ Utils](https://tukaani.org/xz/) - liblzma is in the public domain
 * [jsTree](https://www.jstree.com) - MIT Licence
 * [libgfortran](https://gcc.gnu.org) - GNU GPL Version 2 & GNU GPL Version 3
 * [Dragonegg](https://dragonegg.llvm.org) - GNU GPL Version 2
 * [LLVM Flang](https://github.com/flang-compiler/f18-llvm-project) - Apache Licence Version 2
 * [xterm.js](https://xtermjs.org/) - MIT Licence
 * [Noto Fonts](https://fonts.google.com/noto) - SIL Open Font License

The webR distribution binaries also contain copies of several of the above software. To remain compatible with the GPL, the webR binaries are distributed under the GNU GPL Version 3 Licence (copied below).

Other software in this repository, such as the webR environment setup scripts, build scripts, and additional application software such as the webR REPL are distributed under the MIT Licence (copied below) unless stated otherwise in the source code files.

## The MIT Licence
Copyright (c) 2023 webR authors

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

## The GNU GPL Version 3 Licence

                    GNU GENERAL PUBLIC LICENSE
                       Version 3, 29 June 2007

 Copyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>
 Everyone is permitted to copy and distribute verbatim copies
 of this license document, but changing it is not allowed.

                            Preamble

  The GNU General Public License is a free, copyleft license for
software and other kinds of works.

  The licenses for most software and other practical works are designed
to take away your freedom to share and change the works.  By contrast,
the GNU General Public License is intended to guarantee your freedom to
share and change all versions of a program--to make sure it remains free
software for all its users.  We, the Free Software Foundation, use the
GNU General Public License for most of our software; it applies also to
any other work released this way by its authors.  You can apply it to
your programs, too.

  When we speak of free software, we are referring to freedom, not
price.  Our General Public Licenses are designed to make sure that you
have the freedom to distribute copies of free software (and charge for
them if you wish), that you receive source code or can get it if you
want it, that you can change the software or use pieces of it in new
free programs, and that you know you can do these things.

  To protect your rights, we need to prevent others from denying you
these rights or asking you to surrender the rights.  Therefore, you have
certain responsibilities if you distribute copies of the software, or if
you modify it: responsibilities to respect the freedom of others.

  For example, if you distribute copies of such a program, whether
gratis or for a fee, you must pass on to the recipients the same
freedoms that you received.  You must make sure that they, too, receive
or can get the source code.  And you must show them these terms so they
know their rights.

  Developers that use the GNU GPL protect your rights with two steps:
(1) assert copyright on the software, and (2) offer you this License
giving you legal permission to copy, distribute and/or modify it.

  For the developers' and authors' protection, the GPL clearly explains
that there is no warranty for this free software.  For both users' and
authors' sake, the GPL requires that modified versions be marked as
changed, so that their problems will not be attributed erroneously to
authors of previous versions.

  Some devices are designed to deny users access to install or run
modified versions of the software inside them, although the manufacturer
can do so.  This is fundamentally incompatible with the aim of
protecting users' freedom to change the software.  The systematic
pattern of such abuse occurs in the area of products for individuals to
use, which is precisely where it is most unacceptable.  Therefore, we
have designed this version of the GPL to prohibit the practice for those
products.  If such problems arise substantially in other domains, we
stand ready to extend this provision to those domains in future versions
of the GPL, as needed to protect the freedom of users.

  Finally, every program is threatened constantly by software patents.
States should not allow patents to restrict development and use of
software on general-purpose computers, but in those that do, we wish to
avoid the special danger that patents applied to a free program could
make it effectively proprietary.  To prevent this, the GPL assures that
patents cannot be used to render the program non-free.

  The precise terms and conditions for copying, distribution and
modification follow.

                       TERMS AND CONDITIONS

  0. Definitions.

  "This License" refers to version 3 of the GNU General Public License.

  "Copyright" also means copyright-like laws that apply to other kinds of
works, such as semiconductor masks.

  "The Program" refers to any copyrightable work licensed under this
License.  Each licensee is addressed as "you".  "Licensees" and
"recipients" may be individuals or organizations.

  To "modify" a work means to copy from or adapt all or part of the work
in a fashion requiring copyright permission, other than the making of an
exact copy.  The resulting work is called a "modified version" of the
earlier work or a work "based on" the earlier work.

  A "covered work" means either the unmodified Program or a work based
on the Program.

  To "propagate" a work means to do anything with it that, without
permission, would make you directly or secondarily liable for
infringement under applicable copyright law, except executing it on a
computer or modifying a private copy.  Propagation includes copying,
distribution (with or without modification), making available to the
public, and in some countries other activities as well.

  To "convey" a work means any kind of propagation that enables other
parties to make or receive copies.  Mere interaction with a user through
a computer network, with no transfer of a copy, is not conveying.

  An interactive user interface displays "Appropriate Legal Notices"
to the extent that it includes a convenient and prominently visible
feature that (1) displays an appropriate copyright notice, and (2)
tells the user that there is no warranty for the work (except to the
extent that warranties are provided), that licensees may convey the
work under this License, and how to view a copy of this License.  If
the interface presents a list of user commands or options, such as a
menu, a prominent item in the list meets this criterion.

  1. Source Code.

  The "source code" for a work means the preferred form of the work
for making modifications to it.  "Object code" means any non-source
form of a work.

  A "Standard Interface" means an interface that either is an official
standard defined by a recognized standards body, or, in the case of
interfaces specified for a particular programming language, one that
is widely used among developers working in that language.

  The "System Libraries" of an executable work include anything, other
than the work as a whole, that (a) is included in the normal form of
packaging a Major Component, but which is not part of that Major
Component, and (b) serves only to enable use of the work with that
Major Component, or to implement a Standard Interface for which an
implementation is available to the public in source code form.  A
"Major Component", in this context, means a major essential component
(kernel, window system, and so on) of the specific operating system
(if any) on which the executable work runs, or a compiler used to
produce the work, or an object code interpreter used to run it.

  The "Corresponding Source" for a work in object code form means all
the source code needed to generate, install, and (for an executable
work) run the object code and to modify the work, including scripts to
control those activities.  However, it does not include the work's
System Libraries, or general-purpose tools or generally available free
programs which are used unmodified in performing those activities but
which are not part of the work.  For example, Corresponding Source
includes interface definition files associated with source files for
the work, and the source code for shared libraries and dynamically
linked subprograms that the work is specifically designed to require,
such as by intimate data communication or control flow between those
subprograms and other parts of the work.

  The Corresponding Source need not include anything that users
can regenerate automatically from other parts of the Corresponding
Source.

  The Corresponding Source for a work in source code form is that
same work.

  2. Basic Permissions.

  All rights granted under this License are granted for the term of
copyright on the Program, and are irrevocable provided the stated
conditions are met.  This License explicitly affirms your unlimited
permission to run the unmodified Program.  The output from running a
covered work is covered by this License only if the output, given its
content, constitutes a covered work.  This License acknowledges your
rights of fair use or other equivalent, as provided by copyright law.

  You may make, run and propagate covered works that you do not
convey, without conditions so long as your license otherwise remains
in force.  You may convey covered works to others for the sole purpose
of having them make modifications exclusively for you, or provide you
with facilities for running those works, provided that you comply with
the terms of this License in conveying all material for which you do
not control copyright.  Those thus making or running the covered works
for you must do so exclusively on your behalf, under your direction
and control, on terms that prohibit them from making any copies of
your copyrighted material outside their relationship with you.

  Conveying under any other circumstances is permitted solely under
the conditions stated below.  Sublicensing is not allowed; section 10
makes it unnecessary.

  3. Protecting Users' Legal Rights From Anti-Circumvention Law.

  No covered work shall be deemed part of an effective technological
measure under any applicable law fulfilling obligations under article
11 of the WIPO copyright treaty adopted on 20 December 1996, or
similar laws prohibiting or restricting circumvention of such
measures.

  When you convey a covered work, you waive any legal power to forbid
circumvention of technological measures to the extent such circumvention
is effected by exercising rights under this License with respect to
the covered work, and you disclaim any intention to limit operation or
modification of the work as a means of enforcing, against the work's
users, your or third parties' legal rights to forbid circumvention of
technological measures.

  4. Conveying Verbatim Copies.

  You may convey verbatim copies of the Program's source code as you
receive it, in any medium, provided that you conspicuously and
appropriately publish on each copy an appropriate copyright notice;
keep intact all notices stating that this License and any
non-permissive terms added in accord with section 7 apply to the code;
keep intact all notices of the absence of any warranty; and give all
recipients a copy of this License along with the Program.

  You may charge any price or no price for each copy that you convey,
and you may offer support or warranty protection for a fee.

  5. Conveying Modified Source Versions.

  You may convey a work based on the Program, or the modifications to
produce it from the Program, in the form of source code under the
terms of section 4, provided that you also meet all of these conditions:

    a) The work must carry prominent notices stating that you modified
    it, and giving a relevant date.

    b) The work must carry prominent notices stating that it is
    released under this License and any conditions added under section
    7.  This requirement modifies the requirement in section 4 to
    "keep intact all notices".

    c) You must license the entire work, as a whole, under this
    License to anyone who comes into possession of a copy.  This
    License will therefore apply, along with any applicable section 7
    additional terms, to the whole of the work, and all its parts,
    regardless of how they are packaged.  This License gives no
    permission to license the work in any other way, but it does not
    invalidate such permission if you have separately received it.

    d) If the work has interactive user interfaces, each must display
    Appropriate Legal Notices; however, if the Program has interactive
    interfaces that do not display Appropriate Legal Notices, your
    work need not make them do so.

  A compilation of a covered work with other separate and independent
works, which are not by their nature extensions of the covered work,
and which are not combined with it such as to form a larger program,
in or on a volume of a storage or distribution medium, is called an
"aggregate" if the compilation and its resulting copyright are not
used to limit the access or legal rights of the compilation's users
beyond what the individual works permit.  Inclusion of a covered work
in an aggregate does not cause this License to apply to the other
parts of the aggregate.

  6. Conveying Non-Source Forms.

  You may convey a covered work in object code form under the terms
of sections 4 and 5, provided that you also convey the
machine-readable Corresponding Source under the terms of this License,
in one of these ways:

    a) Convey the object code in, or embodied in, a physical product
    (including a physical distribution medium), accompanied by the
    Corresponding Source fixed on a durable physical medium
    customarily used for software interchange.

    b) Convey the object code in, or embodied in, a physical product
    (including a physical distribution medium), accompanied by a
    written offer, valid for at least three years and valid for as
    long as you offer spare parts or customer support for that product
    model, to give anyone who possesses the object code either (1) a
    copy of the Corresponding Source for all the software in the
    product that is covered by this License, on a durable physical
    medium customarily used for software interchange, for a price no
    more than your reasonable cost of physically performing this
    conveying of source, or (2) access to copy the
    Corresponding Source from a network server at no charge.

    c) Convey individual copies of the object code with a copy of the
    written offer to provide the Corresponding Source.  This
    alternative is allowed only occasionally and noncommercially, and
    only if you received the object code with such an offer, in accord
    with subsection 6b.

    d) Convey the object code by offering access from a designated
    place (gratis or for a charge), and offer equivalent access to the
    Corresponding Source in the same way through the same place at no
    further charge.  You need not require recipients to copy the
    Corresponding Source along with the object code.  If the place to
    copy the object code is a network server, the Corresponding Source
    may be on a different server (operated by you or a third party)
    that supports equivalent copying facilities, provided you maintain
    clear directions next to the object code saying where to find the
    Corresponding Source.  Regardless of what server hosts the
    Corresponding Source, you remain obligated to ensure that it is
    available for as long as needed to satisfy these requirements.

    e) Convey the object code using peer-to-peer transmission, provided
    you inform other peers where the object code and Corresponding
    Source of the work are being offered to the general public at no
    charge under subsection 6d.

  A separable portion of the object code, whose source code is excluded
from the Corresponding Source as a System Library, need not be
included in conveying the object code work.

  A "User Product" is either (1) a "consumer product", which means any
tangible personal property which is normally used for personal, family,
or household purposes, or (2) anything designed or sold for incorporation
into a dwelling.  In determining whether a product is a consumer product,
doubtful cases shall be resolved in favor of coverage.  For a particular
product received by a particular user, "normally used" refers to a
typical or common use of that class of product, regardless of the status
of the particular user or of the way in which the particular user
actually uses, or expects or is expected to use, the product.  A product
is a consumer product regardless of whether the product has substantial
commercial, industrial or non-consumer uses, unless such uses represent
the only significant mode of use of the product.

  "Installation Information" for a User Product means any methods,
procedures, authorization keys, or other information required to install
and execute modified versions of a covered work in that User Product from
a modified version of its Corresponding Source.  The information must
suffice to ensure that the continued functioning of the modified object
code is in no case prevented or interfered with solely because
modification has been made.

  If you convey an object code work under this section in, or with, or
specifically for use in, a User Product, and the conveying occurs as
part of a transaction in which the right of possession and use of the
User Product is transferred to the recipient in perpetuity or for a
fixed term (regardless of how the transaction is characterized), the
Corresponding Source conveyed under this section must be accompanied
by the Installation Information.  But this requirement does not apply
if neither you nor any third party retains the ability to install
modified object code on the User Product (for example, the work has
been installed in ROM).

  The requirement to provide Installation Information does not include a
requirement to continue to provide support service, warranty, or updates
for a work that has been modified or installed by the recipient, or for
the User Product in which it has been modified or installed.  Access to a
network may be denied when the modification itself materially and
adversely affects the operation of the network or violates the rules and
protocols for communication across the network.

  Corresponding Source conveyed, and Installation Information provided,
in accord with this section must be in a format that is publicly
documented (and with an implementation available to the public in
source code form), and must require no special password or key for
unpacking, reading or copying.

  7. Additional Terms.

  "Additional permissions" are terms that supplement the terms of this
License by making exceptions from one or more of its conditions.
Additional permissions that are applicable to the entire Program shall
be treated as though they were included in this License, to the extent
that they are valid under applicable law.  If additional permissions
apply only to part of the Program, that part may be used separately
under those permissions, but the entire Program remains governed by
this License without regard to the additional permissions.

  When you convey a copy of a covered work, you may at your option
remove any additional permissions from that copy, or from any part of
it.  (Additional permissions may be written to require their own
removal in certain cases when you modify the work.)  You may place
additional permissions on material, added by you to a covered work,
for which you have or can give appropriate copyright permission.

  Notwithstanding any other provision of this License, for material you
add to a covered work, you may (if authorized by the copyright holders of
that material) supplement the terms of this License with terms:

    a) Disclaiming warranty or limiting liability differently from the
    terms of sections 15 and 16 of this License; or

    b) Requiring preservation of specified reasonable legal notices or
    author attributions in that material or in the Appropriate Legal
    Notices displayed by works containing it; or

    c) Prohibiting misrepresentation of the origin of that material, or
    requiring that modified versions of such material be marked in
    reasonable ways as different from the original version; or

    d) Limiting the use for publicity purposes of names of licensors or
    authors of the material; or

    e) Declining to grant rights under trademark law for use of some
    trade names, trademarks, or service marks; or

    f) Requiring indemnification of licensors and authors of that
    material by anyone who conveys the material (or modified versions of
    it) with contractual assumptions of liability to the recipient, for
    any liability that these contractual assumptions directly impose on
    those licensors and authors.

  All other non-permissive additional terms are considered "further
restrictions" within the meaning of section 10.  If the Program as you
received it, or any part of it, contains a notice stating that it is
governed by this License along with a term that is a further
restriction, you may remove that term.  If a license document contains
a further restriction but permits relicensing or conveying under this
License, you may add to a covered work material governed by the terms
of that license document, provided that the further restriction does
not survive such relicensing or conveying.

  If you add terms to a covered work in accord with this section, you
must place, in the relevant source files, a statement of the
additional terms that apply to those files, or a notice indicating
where to find the applicable terms.

  Additional terms, permissive or non-permissive, may be stated in the
form of a separately written license, or stated as exceptions;
the above requirements apply either way.

  8. Termination.

  You may not propagate or modify a covered work except as expressly
provided under this License.  Any attempt otherwise to propagate or
modify it is void, and will automatically terminate your rights under
this License (including any patent licenses granted under the third
paragraph of section 11).

  However, if you cease all violation of this License, then your
license from a particular copyright holder is reinstated (a)
provisionally, unless and until the copyright holder explicitly and
finally terminates your license, and (b) permanently, if the copyright
holder fails to notify you of the violation by some reasonable means
prior to 60 days after the cessation.

  Moreover, your license from a particular copyright holder is
reinstated permanently if the copyright holder notifies you of the
violation by some reasonable means, this is the first time you have
received notice of violation of this License (for any work) from that
copyright holder, and you cure the violation prior to 30 days after
your receipt of the notice.

  Termination of your rights under this section does not terminate the
licenses of parties who have received copies or rights from you under
this License.  If your rights have been terminated and not permanently
reinstated, you do not qualify to receive new licenses for the same
material under section 10.

  9. Acceptance Not Required for Having Copies.

  You are not required to accept this License in order to receive or
run a copy of the Program.  Ancillary propagation of a covered work
occurring solely as a consequence of using peer-to-peer transmission
to receive a copy likewise does not require acceptance.  However,
nothing other than this License grants you permission to propagate or
modify any covered work.  These actions infringe copyright if you do
not accept this License.  Therefore, by modifying or propagating a
covered work, you indicate your acceptance of this License to do so.

  10. Automatic Licensing of Downstream Recipients.

  Each time you convey a covered work, the recipient automatically
receives a license from the original licensors, to run, modify and
propagate that work, subject to this License.  You are not responsible
for enforcing compliance by third parties with this License.

  An "entity transaction" is a transaction transferring control of an
organization, or substantially all assets of one, or subdividing an
organization, or merging organizations.  If propagation of a covered
work results from an entity transaction, each party to that
transaction who receives a copy of the work also receives whatever
licenses to the work the party's predecessor in interest had or could
give under the previous paragraph, plus a right to possession of the
Corresponding Source of the work from the predecessor in interest, if
the predecessor has it or can get it with reasonable efforts.

  You may not impose any further restrictions on the exercise of the
rights granted or affirmed under this License.  For example, you may
not impose a license fee, royalty, or other charge for exercise of
rights granted under this License, and you may not initiate litigation
(including a cross-claim or counterclaim in a lawsuit) alleging that
any patent claim is infringed by making, using, selling, offering for
sale, or importing the Program or any portion of it.

  11. Patents.

  A "contributor" is a copyright holder who authorizes use under this
License of the Program or a work on which the Program is based.  The
work thus licensed is called the contributor's "contributor version".

  A contributor's "essential patent claims" are all patent claims
owned or controlled by the contributor, whether already acquired or
hereafter acquired, that would be infringed by some manner, permitted
by this License, of making, using, or selling its contributor version,
but do not include claims that would be infringed only as a
consequence of further modification of the contributor version.  For
purposes of this definition, "control" includes the right to grant
patent sublicenses in a manner consistent with the requirements of
this License.

  Each contributor grants you a non-exclusive, worldwide, royalty-free
patent license under the contributor's essential patent claims, to
make, use, sell, offer for sale, import and otherwise run, modify and
propagate the contents of its contributor version.

  In the following three paragraphs, a "patent license" is any express
agreement or commitment, however denominated, not to enforce a patent
(such as an express permission to practice a patent or covenant not to
sue for patent infringement).  To "grant" such a patent license to a
party means to make such an agreement or commitment not to enforce a
patent against the party.

  If you convey a covered work, knowingly relying on a patent license,
and the Corresponding Source of the work is not available for anyone
to copy, free of charge and under the terms of this License, through a
publicly available network server or other readily accessible means,
then you must either (1) cause the Corresponding Source to be so
available, or (2) arrange to deprive yourself of the benefit of the
patent license for this particular work, or (3) arrange, in a manner
consistent with the requirements of this License, to extend the patent
license to downstream recipients.  "Knowingly relying" means you have
actual knowledge that, but for the patent license, your conveying the
covered work in a country, or your recipient's use of the covered work
in a country, would infringe one or more identifiable patents in that
country that you have reason to believe are valid.

  If, pursuant to or in connection with a single transaction or
arrangement, you convey, or propagate by procuring conveyance of, a
covered work, and grant a patent license to some of the parties
receiving the covered work authorizing them to use, propagate, modify
or convey a specific copy of the covered work, then the patent license
you grant is automatically extended to all recipients of the covered
work and works based on it.

  A patent license is "discriminatory" if it does not include within
the scope of its coverage, prohibits the exercise of, or is
conditioned on the non-exercise of one or more of the rights that are
specifically granted under this License.  You may not convey a covered
work if you are a party to an arrangement with a third party that is
in the business of distributing software, under which you make payment
to the third party based on the extent of your activity of conveying
the work, and under which the third party grants, to any of the
parties who would receive the covered work from you, a discriminatory
patent license (a) in connection with copies of the covered work
conveyed by you (or copies made from those copies), or (b) primarily
for and in connection with specific products or compilations that
contain the covered work, unless you entered into that arrangement,
or that patent license was granted, prior to 28 March 2007.

  Nothing in this License shall be construed as excluding or limiting
any implied license or other defenses to infringement that may
otherwise be available to you under applicable patent law.

  12. No Surrender of Others' Freedom.

  If conditions are imposed on you (whether by court order, agreement or
otherwise) that contradict the conditions of this License, they do not
excuse you from the conditions of this License.  If you cannot convey a
covered work so as to satisfy simultaneously your obligations under this
License and any other pertinent obligations, then as a consequence you may
not convey it at all.  For example, if you agree to terms that obligate you
to collect a royalty for further conveying from those to whom you convey
the Program, the only way you could satisfy both those terms and this
License would be to refrain entirely from conveying the Program.

  13. Use with the GNU Affero General Public License.

  Notwithstanding any other provision of this License, you have
permission to link or combine any covered work with a work licensed
under version 3 of the GNU Affero General Public License into a single
combined work, and to convey the resulting work.  The terms of this
License will continue to apply to the part which is the covered work,
but the special requirements of the GNU Affero General Public License,
section 13, concerning interaction through a network will apply to the
combination as such.

  14. Revised Versions of this License.

  The Free Software Foundation may publish revised and/or new versions of
the GNU General Public License from time to time.  Such new versions will
be similar in spirit to the present version, but may differ in detail to
address new problems or concerns.

  Each version is given a distinguishing version number.  If the
Program specifies that a certain numbered version of the GNU General
Public License "or any later version" applies to it, you have the
option of following the terms and conditions either of that numbered
version or of any later version published by the Free Software
Foundation.  If the Program does not specify a version number of the
GNU General Public License, you may choose any version ever published
by the Free Software Foundation.

  If the Program specifies that a proxy can decide which future
versions of the GNU General Public License can be used, that proxy's
public statement of acceptance of a version permanently authorizes you
to choose that version for the Program.

  Later license versions may give you additional or different
permissions.  However, no additional obligations are imposed on any
author or copyright holder as a result of your choosing to follow a
later version.

  15. Disclaimer of Warranty.

  THERE IS NO WARRANTY FOR THE PROGRAM, TO THE EXTENT PERMITTED BY
APPLICABLE LAW.  EXCEPT WHEN OTHERWISE STATED IN WRITING THE COPYRIGHT
HOLDERS AND/OR OTHER PARTIES PROVIDE THE PROGRAM "AS IS" WITHOUT WARRANTY
OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO,
THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
PURPOSE.  THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE PROGRAM
IS WITH YOU.  SHOULD THE PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF
ALL NECESSARY SERVICING, REPAIR OR CORRECTION.

  16. Limitation of Liability.

  IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MODIFIES AND/OR CONVEYS
THE PROGRAM AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES, INCLUDING ANY
GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE
USE OR INABILITY TO USE THE PROGRAM (INCLUDING BUT NOT LIMITED TO LOSS OF
DATA OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD
PARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY OTHER PROGRAMS),
EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF
SUCH DAMAGES.

  17. Interpretation of Sections 15 and 16.

  If the disclaimer of warranty and limitation of liability provided
above cannot be given local legal effect according to their terms,
reviewing courts shall apply local law that most closely approximates
an absolute waiver of all civil liability in connection with the
Program, unless a warranty or assumption of liability accompanies a
copy of the Program in return for a fee.

                     END OF TERMS AND CONDITIONS

            How to Apply These Terms to Your New Programs

  If you develop a new program, and you want it to be of the greatest
possible use to the public, the best way to achieve this is to make it
free software which everyone can redistribute and change under these terms.

  To do so, attach the following notices to the program.  It is safest
to attach them to the start of each source file to most effectively
state the exclusion of warranty; and each file should have at least
the "copyright" line and a pointer to where the full notice is found.

    <one line to give the program's name and a brief idea of what it does.>
    Copyright (C) <year>  <name of author>

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.

Also add information on how to contact you by electronic and paper mail.

  If the program does terminal interaction, make it output a short
notice like this when it starts in an interactive mode:

    <program>  Copyright (C) <year>  <name of author>
    This program comes with ABSOLUTELY NO WARRANTY; for details type `show w'.
    This is free software, and you are welcome to redistribute it
    under certain conditions; type `show c' for details.

The hypothetical commands `show w' and `show c' should show the appropriate
parts of the General Public License.  Of course, your program's commands
might be different; for a GUI interface, you would use an "about box".

  You should also get your employer (if you work as a programmer) or school,
if any, to sign a "copyright disclaimer" for the program, if necessary.
For more information on this, and how to apply and follow the GNU GPL, see
<https://www.gnu.org/licenses/>.

  The GNU General Public License does not permit incorporating your program
into proprietary programs.  If your program is a subroutine library, you
may consider it more useful to permit linking proprietary applications with
the library.  If this is what you want to do, use the GNU Lesser General
Public License instead of this License.  But first, please read
<https://www.gnu.org/licenses/why-not-lgpl.html>.


https://github.com/s-macke/jor1k-sysroot/commit/81c099883f2bfee62fbfdb305fc2b65188a949be

The MIT License (MIT)

Copyright (c) 2014 Sebastian Macke

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

https://opensource.org/licenses/MIT

https://github.com/s-macke/jor1k/blob/master/LICENSE.md

Copyright (c) 2014, Sebastian Macke All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


## https://github.com/datacamp/datacamp-light/blob/master/LICENSE

                    GNU GENERAL PUBLIC LICENSE
                       Version 3, 29 June 2007

 Copyright (C) 2007 Free Software Foundation, Inc. <http://fsf.org/>
 Everyone is permitted to copy and distribute verbatim copies
 of this license document, but changing it is not allowed.

                            Preamble

  The GNU General Public License is a free, copyleft license for
software and other kinds of works.

  The licenses for most software and other practical works are designed
to take away your freedom to share and change the works.  By contrast,
the GNU General Public License is intended to guarantee your freedom to
share and change all versions of a program--to make sure it remains free
software for all its users.  We, the Free Software Foundation, use the
GNU General Public License for most of our software; it applies also to
any other work released this way by its authors.  You can apply it to
your programs, too.

  When we speak of free software, we are referring to freedom, not
price.  Our General Public Licenses are designed to make sure that you
have the freedom to distribute copies of free software (and charge for
them if you wish), that you receive source code or can get it if you
want it, that you can change the software or use pieces of it in new
free programs, and that you know you can do these things.

  To protect your rights, we need to prevent others from denying you
these rights or asking you to surrender the rights.  Therefore, you have
certain responsibilities if you distribute copies of the software, or if
you modify it: responsibilities to respect the freedom of others.

  For example, if you distribute copies of such a program, whether
gratis or for a fee, you must pass on to the recipients the same
freedoms that you received.  You must make sure that they, too, receive
or can get the source code.  And you must show them these terms so they
know their rights.

  Developers that use the GNU GPL protect your rights with two steps:
(1) assert copyright on the software, and (2) offer you this License
giving you legal permission to copy, distribute and/or modify it.

  For the developers' and authors' protection, the GPL clearly explains
that there is no warranty for this free software.  For both users' and
authors' sake, the GPL requires that modified versions be marked as
changed, so that their problems will not be attributed erroneously to
authors of previous versions.

  Some devices are designed to deny users access to install or run
modified versions of the software inside them, although the manufacturer
can do so.  This is fundamentally incompatible with the aim of
protecting users' freedom to change the software.  The systematic
pattern of such abuse occurs in the area of products for individuals to
use, which is precisely where it is most unacceptable.  Therefore, we
have designed this version of the GPL to prohibit the practice for those
products.  If such problems arise substantially in other domains, we
stand ready to extend this provision to those domains in future versions
of the GPL, as needed to protect the freedom of users.

  Finally, every program is threatened constantly by software patents.
States should not allow patents to restrict development and use of
software on general-purpose computers, but in those that do, we wish to
avoid the special danger that patents applied to a free program could
make it effectively proprietary.  To prevent this, the GPL assures that
patents cannot be used to render the program non-free.

  The precise terms and conditions for copying, distribution and
modification follow.

                       TERMS AND CONDITIONS

  0. Definitions.

  "This License" refers to version 3 of the GNU General Public License.

  "Copyright" also means copyright-like laws that apply to other kinds of
works, such as semiconductor masks.

  "The Program" refers to any copyrightable work licensed under this
License.  Each licensee is addressed as "you".  "Licensees" and
"recipients" may be individuals or organizations.

  To "modify" a work means to copy from or adapt all or part of the work
in a fashion requiring copyright permission, other than the making of an
exact copy.  The resulting work is called a "modified version" of the
earlier work or a work "based on" the earlier work.

  A "covered work" means either the unmodified Program or a work based
on the Program.

  To "propagate" a work means to do anything with it that, without
permission, would make you directly or secondarily liable for
infringement under applicable copyright law, except executing it on a
computer or modifying a private copy.  Propagation includes copying,
distribution (with or without modification), making available to the
public, and in some countries other activities as well.

  To "convey" a work means any kind of propagation that enables other
parties to make or receive copies.  Mere interaction with a user through
a computer network, with no transfer of a copy, is not conveying.

  An interactive user interface displays "Appropriate Legal Notices"
to the extent that it includes a convenient and prominently visible
feature that (1) displays an appropriate copyright notice, and (2)
tells the user that there is no warranty for the work (except to the
extent that warranties are provided), that licensees may convey the
work under this License, and how to view a copy of this License.  If
the interface presents a list of user commands or options, such as a
menu, a prominent item in the list meets this criterion.

  1. Source Code.

  The "source code" for a work means the preferred form of the work
for making modifications to it.  "Object code" means any non-source
form of a work.

  A "Standard Interface" means an interface that either is an official
standard defined by a recognized standards body, or, in the case of
interfaces specified for a particular programming language, one that
is widely used among developers working in that language.

  The "System Libraries" of an executable work include anything, other
than the work as a whole, that (a) is included in the normal form of
packaging a Major Component, but which is not part of that Major
Component, and (b) serves only to enable use of the work with that
Major Component, or to implement a Standard Interface for which an
implementation is available to the public in source code form.  A
"Major Component", in this context, means a major essential component
(kernel, window system, and so on) of the specific operating system
(if any) on which the executable work runs, or a compiler used to
produce the work, or an object code interpreter used to run it.

  The "Corresponding Source" for a work in object code form means all
the source code needed to generate, install, and (for an executable
work) run the object code and to modify the work, including scripts to
control those activities.  However, it does not include the work's
System Libraries, or general-purpose tools or generally available free
programs which are used unmodified in performing those activities but
which are not part of the work.  For example, Corresponding Source
includes interface definition files associated with source files for
the work, and the source code for shared libraries and dynamically
linked subprograms that the work is specifically designed to require,
such as by intimate data communication or control flow between those
subprograms and other parts of the work.

  The Corresponding Source need not include anything that users
can regenerate automatically from other parts of the Corresponding
Source.

  The Corresponding Source for a work in source code form is that
same work.

  2. Basic Permissions.

  All rights granted under this License are granted for the term of
copyright on the Program, and are irrevocable provided the stated
conditions are met.  This License explicitly affirms your unlimited
permission to run the unmodified Program.  The output from running a
covered work is covered by this License only if the output, given its
content, constitutes a covered work.  This License acknowledges your
rights of fair use or other equivalent, as provided by copyright law.

  You may make, run and propagate covered works that you do not
convey, without conditions so long as your license otherwise remains
in force.  You may convey covered works to others for the sole purpose
of having them make modifications exclusively for you, or provide you
with facilities for running those works, provided that you comply with
the terms of this License in conveying all material for which you do
not control copyright.  Those thus making or running the covered works
for you must do so exclusively on your behalf, under your direction
and control, on terms that prohibit them from making any copies of
your copyrighted material outside their relationship with you.

  Conveying under any other circumstances is permitted solely under
the conditions stated below.  Sublicensing is not allowed; section 10
makes it unnecessary.

  3. Protecting Users' Legal Rights From Anti-Circumvention Law.

  No covered work shall be deemed part of an effective technological
measure under any applicable law fulfilling obligations under article
11 of the WIPO copyright treaty adopted on 20 December 1996, or
similar laws prohibiting or restricting circumvention of such
measures.

  When you convey a covered work, you waive any legal power to forbid
circumvention of technological measures to the extent such circumvention
is effected by exercising rights under this License with respect to
the covered work, and you disclaim any intention to limit operation or
modification of the work as a means of enforcing, against the work's
users, your or third parties' legal rights to forbid circumvention of
technological measures.

  4. Conveying Verbatim Copies.

  You may convey verbatim copies of the Program's source code as you
receive it, in any medium, provided that you conspicuously and
appropriately publish on each copy an appropriate copyright notice;
keep intact all notices stating that this License and any
non-permissive terms added in accord with section 7 apply to the code;
keep intact all notices of the absence of any warranty; and give all
recipients a copy of this License along with the Program.

  You may charge any price or no price for each copy that you convey,
and you may offer support or warranty protection for a fee.

  5. Conveying Modified Source Versions.

  You may convey a work based on the Program, or the modifications to
produce it from the Program, in the form of source code under the
terms of section 4, provided that you also meet all of these conditions:

    a) The work must carry prominent notices stating that you modified
    it, and giving a relevant date.

    b) The work must carry prominent notices stating that it is
    released under this License and any conditions added under section
    7.  This requirement modifies the requirement in section 4 to
    "keep intact all notices".

    c) You must license the entire work, as a whole, under this
    License to anyone who comes into possession of a copy.  This
    License will therefore apply, along with any applicable section 7
    additional terms, to the whole of the work, and all its parts,
    regardless of how they are packaged.  This License gives no
    permission to license the work in any other way, but it does not
    invalidate such permission if you have separately received it.

    d) If the work has interactive user interfaces, each must display
    Appropriate Legal Notices; however, if the Program has interactive
    interfaces that do not display Appropriate Legal Notices, your
    work need not make them do so.

  A compilation of a covered work with other separate and independent
works, which are not by their nature extensions of the covered work,
and which are not combined with it such as to form a larger program,
in or on a volume of a storage or distribution medium, is called an
"aggregate" if the compilation and its resulting copyright are not
used to limit the access or legal rights of the compilation's users
beyond what the individual works permit.  Inclusion of a covered work
in an aggregate does not cause this License to apply to the other
parts of the aggregate.

  6. Conveying Non-Source Forms.

  You may convey a covered work in object code form under the terms
of sections 4 and 5, provided that you also convey the
machine-readable Corresponding Source under the terms of this License,
in one of these ways:

    a) Convey the object code in, or embodied in, a physical product
    (including a physical distribution medium), accompanied by the
    Corresponding Source fixed on a durable physical medium
    customarily used for software interchange.

    b) Convey the object code in, or embodied in, a physical product
    (including a physical distribution medium), accompanied by a
    written offer, valid for at least three years and valid for as
    long as you offer spare parts or customer support for that product
    model, to give anyone who possesses the object code either (1) a
    copy of the Corresponding Source for all the software in the
    product that is covered by this License, on a durable physical
    medium customarily used for software interchange, for a price no
    more than your reasonable cost of physically performing this
    conveying of source, or (2) access to copy the
    Corresponding Source from a network server at no charge.

    c) Convey individual copies of the object code with a copy of the
    written offer to provide the Corresponding Source.  This
    alternative is allowed only occasionally and noncommercially, and
    only if you received the object code with such an offer, in accord
    with subsection 6b.

    d) Convey the object code by offering access from a designated
    place (gratis or for a charge), and offer equivalent access to the
    Corresponding Source in the same way through the same place at no
    further charge.  You need not require recipients to copy the
    Corresponding Source along with the object code.  If the place to
    copy the object code is a network server, the Corresponding Source
    may be on a different server (operated by you or a third party)
    that supports equivalent copying facilities, provided you maintain
    clear directions next to the object code saying where to find the
    Corresponding Source.  Regardless of what server hosts the
    Corresponding Source, you remain obligated to ensure that it is
    available for as long as needed to satisfy these requirements.

    e) Convey the object code using peer-to-peer transmission, provided
    you inform other peers where the object code and Corresponding
    Source of the work are being offered to the general public at no
    charge under subsection 6d.

  A separable portion of the object code, whose source code is excluded
from the Corresponding Source as a System Library, need not be
included in conveying the object code work.

  A "User Product" is either (1) a "consumer product", which means any
tangible personal property which is normally used for personal, family,
or household purposes, or (2) anything designed or sold for incorporation
into a dwelling.  In determining whether a product is a consumer product,
doubtful cases shall be resolved in favor of coverage.  For a particular
product received by a particular user, "normally used" refers to a
typical or common use of that class of product, regardless of the status
of the particular user or of the way in which the particular user
actually uses, or expects or is expected to use, the product.  A product
is a consumer product regardless of whether the product has substantial
commercial, industrial or non-consumer uses, unless such uses represent
the only significant mode of use of the product.

  "Installation Information" for a User Product means any methods,
procedures, authorization keys, or other information required to install
and execute modified versions of a covered work in that User Product from
a modified version of its Corresponding Source.  The information must
suffice to ensure that the continued functioning of the modified object
code is in no case prevented or interfered with solely because
modification has been made.

  If you convey an object code work under this section in, or with, or
specifically for use in, a User Product, and the conveying occurs as
part of a transaction in which the right of possession and use of the
User Product is transferred to the recipient in perpetuity or for a
fixed term (regardless of how the transaction is characterized), the
Corresponding Source conveyed under this section must be accompanied
by the Installation Information.  But this requirement does not apply
if neither you nor any third party retains the ability to install
modified object code on the User Product (for example, the work has
been installed in ROM).

  The requirement to provide Installation Information does not include a
requirement to continue to provide support service, warranty, or updates
for a work that has been modified or installed by the recipient, or for
the User Product in which it has been modified or installed.  Access to a
network may be denied when the modification itself materially and
adversely affects the operation of the network or violates the rules and
protocols for communication across the network.

  Corresponding Source conveyed, and Installation Information provided,
in accord with this section must be in a format that is publicly
documented (and with an implementation available to the public in
source code form), and must require no special password or key for
unpacking, reading or copying.

  7. Additional Terms.

  "Additional permissions" are terms that supplement the terms of this
License by making exceptions from one or more of its conditions.
Additional permissions that are applicable to the entire Program shall
be treated as though they were included in this License, to the extent
that they are valid under applicable law.  If additional permissions
apply only to part of the Program, that part may be used separately
under those permissions, but the entire Program remains governed by
this License without regard to the additional permissions.

  When you convey a copy of a covered work, you may at your option
remove any additional permissions from that copy, or from any part of
it.  (Additional permissions may be written to require their own
removal in certain cases when you modify the work.)  You may place
additional permissions on material, added by you to a covered work,
for which you have or can give appropriate copyright permission.

  Notwithstanding any other provision of this License, for material you
add to a covered work, you may (if authorized by the copyright holders of
that material) supplement the terms of this License with terms:

    a) Disclaiming warranty or limiting liability differently from the
    terms of sections 15 and 16 of this License; or

    b) Requiring preservation of specified reasonable legal notices or
    author attributions in that material or in the Appropriate Legal
    Notices displayed by works containing it; or

    c) Prohibiting misrepresentation of the origin of that material, or
    requiring that modified versions of such material be marked in
    reasonable ways as different from the original version; or

    d) Limiting the use for publicity purposes of names of licensors or
    authors of the material; or

    e) Declining to grant rights under trademark law for use of some
    trade names, trademarks, or service marks; or

    f) Requiring indemnification of licensors and authors of that
    material by anyone who conveys the material (or modified versions of
    it) with contractual assumptions of liability to the recipient, for
    any liability that these contractual assumptions directly impose on
    those licensors and authors.

  All other non-permissive additional terms are considered "further
restrictions" within the meaning of section 10.  If the Program as you
received it, or any part of it, contains a notice stating that it is
governed by this License along with a term that is a further
restriction, you may remove that term.  If a license document contains
a further restriction but permits relicensing or conveying under this
License, you may add to a covered work material governed by the terms
of that license document, provided that the further restriction does
not survive such relicensing or conveying.

  If you add terms to a covered work in accord with this section, you
must place, in the relevant source files, a statement of the
additional terms that apply to those files, or a notice indicating
where to find the applicable terms.

  Additional terms, permissive or non-permissive, may be stated in the
form of a separately written license, or stated as exceptions;
the above requirements apply either way.

  8. Termination.

  You may not propagate or modify a covered work except as expressly
provided under this License.  Any attempt otherwise to propagate or
modify it is void, and will automatically terminate your rights under
this License (including any patent licenses granted under the third
paragraph of section 11).

  However, if you cease all violation of this License, then your
license from a particular copyright holder is reinstated (a)
provisionally, unless and until the copyright holder explicitly and
finally terminates your license, and (b) permanently, if the copyright
holder fails to notify you of the violation by some reasonable means
prior to 60 days after the cessation.

  Moreover, your license from a particular copyright holder is
reinstated permanently if the copyright holder notifies you of the
violation by some reasonable means, this is the first time you have
received notice of violation of this License (for any work) from that
copyright holder, and you cure the violation prior to 30 days after
your receipt of the notice.

  Termination of your rights under this section does not terminate the
licenses of parties who have received copies or rights from you under
this License.  If your rights have been terminated and not permanently
reinstated, you do not qualify to receive new licenses for the same
material under section 10.

  9. Acceptance Not Required for Having Copies.

  You are not required to accept this License in order to receive or
run a copy of the Program.  Ancillary propagation of a covered work
occurring solely as a consequence of using peer-to-peer transmission
to receive a copy likewise does not require acceptance.  However,
nothing other than this License grants you permission to propagate or
modify any covered work.  These actions infringe copyright if you do
not accept this License.  Therefore, by modifying or propagating a
covered work, you indicate your acceptance of this License to do so.

  10. Automatic Licensing of Downstream Recipients.

  Each time you convey a covered work, the recipient automatically
receives a license from the original licensors, to run, modify and
propagate that work, subject to this License.  You are not responsible
for enforcing compliance by third parties with this License.

  An "entity transaction" is a transaction transferring control of an
organization, or substantially all assets of one, or subdividing an
organization, or merging organizations.  If propagation of a covered
work results from an entity transaction, each party to that
transaction who receives a copy of the work also receives whatever
licenses to the work the party's predecessor in interest had or could
give under the previous paragraph, plus a right to possession of the
Corresponding Source of the work from the predecessor in interest, if
the predecessor has it or can get it with reasonable efforts.

  You may not impose any further restrictions on the exercise of the
rights granted or affirmed under this License.  For example, you may
not impose a license fee, royalty, or other charge for exercise of
rights granted under this License, and you may not initiate litigation
(including a cross-claim or counterclaim in a lawsuit) alleging that
any patent claim is infringed by making, using, selling, offering for
sale, or importing the Program or any portion of it.

  11. Patents.

  A "contributor" is a copyright holder who authorizes use under this
License of the Program or a work on which the Program is based.  The
work thus licensed is called the contributor's "contributor version".

  A contributor's "essential patent claims" are all patent claims
owned or controlled by the contributor, whether already acquired or
hereafter acquired, that would be infringed by some manner, permitted
by this License, of making, using, or selling its contributor version,
but do not include claims that would be infringed only as a
consequence of further modification of the contributor version.  For
purposes of this definition, "control" includes the right to grant
patent sublicenses in a manner consistent with the requirements of
this License.

  Each contributor grants you a non-exclusive, worldwide, royalty-free
patent license under the contributor's essential patent claims, to
make, use, sell, offer for sale, import and otherwise run, modify and
propagate the contents of its contributor version.

  In the following three paragraphs, a "patent license" is any express
agreement or commitment, however denominated, not to enforce a patent
(such as an express permission to practice a patent or covenant not to
sue for patent infringement).  To "grant" such a patent license to a
party means to make such an agreement or commitment not to enforce a
patent against the party.

  If you convey a covered work, knowingly relying on a patent license,
and the Corresponding Source of the work is not available for anyone
to copy, free of charge and under the terms of this License, through a
publicly available network server or other readily accessible means,
then you must either (1) cause the Corresponding Source to be so
available, or (2) arrange to deprive yourself of the benefit of the
patent license for this particular work, or (3) arrange, in a manner
consistent with the requirements of this License, to extend the patent
license to downstream recipients.  "Knowingly relying" means you have
actual knowledge that, but for the patent license, your conveying the
covered work in a country, or your recipient's use of the covered work
in a country, would infringe one or more identifiable patents in that
country that you have reason to believe are valid.

  If, pursuant to or in connection with a single transaction or
arrangement, you convey, or propagate by procuring conveyance of, a
covered work, and grant a patent license to some of the parties
receiving the covered work authorizing them to use, propagate, modify
or convey a specific copy of the covered work, then the patent license
you grant is automatically extended to all recipients of the covered
work and works based on it.

  A patent license is "discriminatory" if it does not include within
the scope of its coverage, prohibits the exercise of, or is
conditioned on the non-exercise of one or more of the rights that are
specifically granted under this License.  You may not convey a covered
work if you are a party to an arrangement with a third party that is
in the business of distributing software, under which you make payment
to the third party based on the extent of your activity of conveying
the work, and under which the third party grants, to any of the
parties who would receive the covered work from you, a discriminatory
patent license (a) in connection with copies of the covered work
conveyed by you (or copies made from those copies), or (b) primarily
for and in connection with specific products or compilations that
contain the covered work, unless you entered into that arrangement,
or that patent license was granted, prior to 28 March 2007.

  Nothing in this License shall be construed as excluding or limiting
any implied license or other defenses to infringement that may
otherwise be available to you under applicable patent law.

  12. No Surrender of Others' Freedom.

  If conditions are imposed on you (whether by court order, agreement or
otherwise) that contradict the conditions of this License, they do not
excuse you from the conditions of this License.  If you cannot convey a
covered work so as to satisfy simultaneously your obligations under this
License and any other pertinent obligations, then as a consequence you may
not convey it at all.  For example, if you agree to terms that obligate you
to collect a royalty for further conveying from those to whom you convey
the Program, the only way you could satisfy both those terms and this
License would be to refrain entirely from conveying the Program.

  13. Use with the GNU Affero General Public License.

  Notwithstanding any other provision of this License, you have
permission to link or combine any covered work with a work licensed
under version 3 of the GNU Affero General Public License into a single
combined work, and to convey the resulting work.  The terms of this
License will continue to apply to the part which is the covered work,
but the special requirements of the GNU Affero General Public License,
section 13, concerning interaction through a network will apply to the
combination as such.

  14. Revised Versions of this License.

  The Free Software Foundation may publish revised and/or new versions of
the GNU General Public License from time to time.  Such new versions will
be similar in spirit to the present version, but may differ in detail to
address new problems or concerns.

  Each version is given a distinguishing version number.  If the
Program specifies that a certain numbered version of the GNU General
Public License "or any later version" applies to it, you have the
option of following the terms and conditions either of that numbered
version or of any later version published by the Free Software
Foundation.  If the Program does not specify a version number of the
GNU General Public License, you may choose any version ever published
by the Free Software Foundation.

  If the Program specifies that a proxy can decide which future
versions of the GNU General Public License can be used, that proxy's
public statement of acceptance of a version permanently authorizes you
to choose that version for the Program.

  Later license versions may give you additional or different
permissions.  However, no additional obligations are imposed on any
author or copyright holder as a result of your choosing to follow a
later version.

  15. Disclaimer of Warranty.

  THERE IS NO WARRANTY FOR THE PROGRAM, TO THE EXTENT PERMITTED BY
APPLICABLE LAW.  EXCEPT WHEN OTHERWISE STATED IN WRITING THE COPYRIGHT
HOLDERS AND/OR OTHER PARTIES PROVIDE THE PROGRAM "AS IS" WITHOUT WARRANTY
OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO,
THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
PURPOSE.  THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE PROGRAM
IS WITH YOU.  SHOULD THE PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF
ALL NECESSARY SERVICING, REPAIR OR CORRECTION.

  16. Limitation of Liability.

  IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MODIFIES AND/OR CONVEYS
THE PROGRAM AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES, INCLUDING ANY
GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE
USE OR INABILITY TO USE THE PROGRAM (INCLUDING BUT NOT LIMITED TO LOSS OF
DATA OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD
PARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY OTHER PROGRAMS),
EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF
SUCH DAMAGES.

  17. Interpretation of Sections 15 and 16.

  If the disclaimer of warranty and limitation of liability provided
above cannot be given local legal effect according to their terms,
reviewing courts shall apply local law that most closely approximates
an absolute waiver of all civil liability in connection with the
Program, unless a warranty or assumption of liability accompanies a
copy of the Program in return for a fee.

                     END OF TERMS AND CONDITIONS

            How to Apply These Terms to Your New Programs

  If you develop a new program, and you want it to be of the greatest
possible use to the public, the best way to achieve this is to make it
free software which everyone can redistribute and change under these terms.

  To do so, attach the following notices to the program.  It is safest
to attach them to the start of each source file to most effectively
state the exclusion of warranty; and each file should have at least
the "copyright" line and a pointer to where the full notice is found.

    {one line to give the program's name and a brief idea of what it does.}
    Copyright (C) {year}  {name of author}

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.

Also add information on how to contact you by electronic and paper mail.

  If the program does terminal interaction, make it output a short
notice like this when it starts in an interactive mode:

    {project}  Copyright (C) {year}  {fullname}
    This program comes with ABSOLUTELY NO WARRANTY; for details type `show w'.
    This is free software, and you are welcome to redistribute it
    under certain conditions; type `show c' for details.

The hypothetical commands `show w' and `show c' should show the appropriate
parts of the General Public License.  Of course, your program's commands
might be different; for a GUI interface, you would use an "about box".

  You should also get your employer (if you work as a programmer) or school,
if any, to sign a "copyright disclaimer" for the program, if necessary.
For more information on this, and how to apply and follow the GNU GPL, see
<http://www.gnu.org/licenses/>.

  The GNU General Public License does not permit incorporating your program
into proprietary programs.  If your program is a subroutine library, you
may consider it more useful to permit linking proprietary applications with
the library.  If this is what you want to do, use the GNU Lesser General
Public License instead of this License.  But first, please read
<http://www.gnu.org/philosophy/why-not-lgpl.html>.



"""
    
    let gotamail1 = """
Delivered-To: lacevedoarreguin@mpc.edu
Received: by 2002:a5d:9748:0:0:0:0:0 with SMTP id c8csp1840668ioo;
        Sun, 9 Oct 2022 06:38:19 -0700 (PDT)

Subject: Re: jor1k license
To: Luis Acevedo-arreguin <lacevedoarreguin@mpc.edu>
References: <CADtow6f947JKJ+DS-Ns4edG4JBW8Uvm1-300x4yD24G630K9vg@mail.gmail.com>
From: Sebastian Macke <sebastian@macke.de>
In-Reply-To: <CADtow6f947JKJ+DS-Ns4edG4JBW8Uvm1-300x4yD24G630K9vg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: sebastian@macke.de
X-Virus-Scanned: Clear (ClamAV 0.103.7/26684/Sun Oct
  9 09:59:27 2022)

Hi Luis Acevedo-Arreguin,

here is the License file:
https://github.com/s-macke/jor1k/blob/master/LICENSE.md
which should be very similar or identical to the permissive MIT License:
https://opensource.org/licenses/MIT

So feel free to use jor1k in your project.

Best regards

Sebastian



"""
    
    let readme1 = """

[0] To use one of the first versions of WebR, enter your code on the editor (the gray or black rectangle next to the bottom of the screen). Wait for the local server to compile your code. This is a work in progress because running Webassembly code in this device is not easy. If you want only WebR in your device, please download "webin-R" from the App Store. WebR uses jquery.terminal and swifter, whose licenses are in the next pages.

[1] The DataCamp R Console requires an internet connection. To use R from the DataCamp website, enter your code on the editor (the gray or black rectangle next to the bottom of the screen). When finished, press the OFF icon to hide the keyboard, so you can see the RUN button on the DataCamp website. Wait for the remote server to compile your code.

[2] The jor1k-Linux terminal works offline and plays most Linux commands. An internet connection is optional. If you want only the jor1k terminal in your device, please download "jor1k-Linux" from the App Store. To run R on the jor1k-Linux terminal, there is a script running in the background. Otherwise the user should type in 'startx &' and press enter and wait until the message "Building XImage... done" shows up, and then finally press enter again and type in R and press ENTER. The good news is the the script does that for you!

    Once your R Console is ready, try your code. For example, enter the following lines:

x=rnorm(228)
hist(x)

    You can see the plot on the display area below the terminal. Once the plot is generated, click the maximize button in the toolbar on the top right of the white area. On the other hand, if you want to generate some plots in a PDF format, adapt the following lines to your R script:

pdf('FileName.pdf')  # the file name is optional
... your code generaring a plot ...
dev.off()

Once you finish, press the button "Show PDF" or "Share PDF" if you want to save your plots. These buttons only work once you have generated a plot in a PDF format by using the commands pdf() and dev.off(). You may need to press the button "Share PDF" twice, an issue I am still working on.

Play with this example code:

pdf()
x = rnorm(2222)
hist(x, col='orange')
dev.off()

EXTRA FEATURES

You can play with the most recent version of R by pressing ^Z on the toolbar and then entering R422.8

You can also play with an old version of R by by pressing ^Z on the toolbar and then entering R049

Then click the button to maximize the screen in the display area at the bottom. After that, go back to the terminal and type something like:

x <- rnorm(228)
hist(x, col='red')

Press enter and check the display area. Note that this old version of the language,  R-0.49, does not accept the equal sign to assign values to a variable. You have to use <- and there is no PDF device to generate plots in that format.

This app aims to provide an educational tool for people interested in computer science and/or statistics. The idea to develop this app originated in a college classroom where I teach mathematics and statistics by using language R. My students are strongly attached to their smartphones and iPads so developing an app to keep them engaged in using some computer languages to solve problems in math courses seemed to be a natural course of action, a way to connect two different generations, two different ways of learning, and a minimal effort to provide resources to minority students in my community.
This app has been used by some of the students in my class of Elementary Statistics at Monterey Peninsula College. This is a work in progress, so any suggestions or comments to improve this app will be greatly appreciated. Go to www.math-hikers.com for more info or send your ideas to luis.arreguin.000@gmail.com

(c) Luis Acevedo-Arreguin, PO Box 1011, Castroville, CA, on 02/11/2024.

******************* READ LICENSES BELOW ************************

The license to use the WebR web app is provided at
    https://webr.r-wasm.org/

The license to apply the DataCamp platform is provided at https://github.com/datacamp/datacamp-light and included at the end of the next section.

The license to use jor1k is provided at
    https://github.com/s-macke/jor1k/blob/master/LICENSE.md

The license to use jquery.terminal is provided at
    https://github.com/jcubic/jquery.terminal
The license to use swifter is provided at
    https://github.com/httpswift/swifter

******************* READ LICENSES BELOW ************************

"""
    
    
    
    
    
    
    
    
    
    
    var body: some View {
        
        let webTerminal = LinuxTerm(text00: $text0, text03A: $text822, testJor1k: $getShell01, getJSLinux: $getShell02, getKerTeX: $getShell03, selectedLinux: $selectedLinux, getPDF: $getRplot, getFile1: $getFile1, plotImage: $plotImage, currentURL: $currentLoc, viewModel: viewModel)

        
        Spacer()
 
        
        // Image(uiImage: UIImage(named: "icon-022a") ?? UIImage())
        let url0 = Bundle.main.url(forResource: "icon-022a--152", withExtension: "jpg")!
        
        VStack {
        AsyncImage(url: url0) // URL(string: "https://your_image_url_address"))
        }
     //      .resizable()
        .frame(width: 82.2, height: 82.2)
        
        Spacer()
        // R-StatsCalc version 1.0
        
        Text("# R-StatsCalc \nVersion 4.4.4").font(.title)
       // Text("# VERSION <- '4.2.2' ")
        //Text("MESSAGE <- 'Hello, World!'")
         Spacer()
        
        
         
        HStack {
            
            Button {
                getRonline = true
                
                
            } label: {
                Text(" R\nOnline\nConsole ")
                    .font(.title2)
              //      .background(.yellow)
                    .overlay(
                        //   RoundedRectangle(cornerRadius: 8)
                        Circle()
                    //        .fill(.purple)
                            .frame(width: 150, height: 150)
                            .opacity(0.15)
                        // .stroke(Color.primary, lineWidth: 1)
                    )
                    .frame(width: 182.2, height: 122.8)
            }
            .sheet(isPresented: $getRonline) {
                
                
                
                VStack {
                    
                    GeometryReader.init { geometry in
                        ScrollView.init {
                            
                            
                            DCLWebsite(text00: $text0)
                                .frame(width: UIScreen.main.bounds.width, height: 375)
                                .onTapGesture {
                                    consoleMode = true
                                }
                            
                        } // end ScrollView
                    } // end GeometryReader
                    
                    
                    StatsCalcView(consoleMode: $consoleMode, consoleBackground: $consoleBackground, text01: $text0, capsLockOn: $capsLockOn)
                        .frame(width: UIScreen.main.bounds.width*0.682, height: 25 ) // height: 228)
                        .onTapGesture {
                            consoleMode = true
                        }
                    
                    
                    HStack {
                        Spacer()
                        Button {
                            consoleMode.toggle()
                            
                        } label: {
                            if consoleMode {
                                Text(" CONSOLE MODE ")
                                    .background(.yellow)
                            }   else {
                                Text(" EDITOR MODE ")
                            }
                        } // end button label
                        
                        Spacer()
                        Button {
                            consoleBackground.toggle()
                            
                        } label: {
                            if consoleBackground {
                                Text(" Light ")
                            }   else {
                                Text(" Dark ")
                            }
                        } // end button label
                        
                        
                        Spacer()
                        Spacer()
                        
                        Image(uiImage: UIImage(named: "AppIcon") ?? UIImage())
                            .resizable()
                            .frame(width: 33.3, height: 22.8)
                        Spacer()
                    } // end HStack
                    
                    
                } // end VStack
                
                
                Button {
                    getRonline = false
                } label: {
                    Text("Home")
                }
                
            } // end button sheet for Online R Console
            
            
            // webR 0.0.1 new component section
            
            Button {
                getWebR = true
                // print(URL.documentsDirectory) //only available in iOS 16 or newer
                getTemporaryDirectoryFiles()
                let tempDirectoryURL = FileManager.default.temporaryDirectory // NSURL.fileURL(withPath: NSTemporaryDirectory(), isDirectory: true)
                let targetURL = tempDirectoryURL.appendingPathComponent("webR-0.0")
                if !FileManager.default.fileExists(atPath: targetURL.path) {
                    
                    print("\n[button] Folder webR-0.x will be at /tmp location \(targetURL.description):\n")
                    setupWebR()
                    setupSource()
                } else {
                    
                    print("\n[button] Folder webR-0.0 already exists at /tmp location:\n")
                    
                    } // end if-then-else for tmp directory webR-0.0
                
                
            } label: {
                Text(" WebR ")
                    .font(.title)
              //      .background(.yellow)
                    .overlay(
                        //   RoundedRectangle(cornerRadius: 8)
                        Circle()
                   //         .fill(.blue)
                            .frame(width: 150, height: 150)
                            .opacity(0.15)
                        // .stroke(Color.primary, lineWidth: 1)
                    )
                    .frame(width: 182.2, height: 122.8)
            }
            .sheet(isPresented: $getWebR) {
                
                VStack {
                    
                    GeometryReader.init { geometry in
                        ScrollView.init {
                            
                            
           //                 WebRWebsite(text00: $text0)
           //                     .frame(width: UIScreen.main.bounds.width, height: 375)
                            // WebRWebsite(text00: $text0)
                            WebRSite(text00: $text0, server00: $server00, flag1: $flag1, flag2: $flag2) // SafariView()
                                .frame(width: UIScreen.main.bounds.width*0.822, height: 333)
                                .padding(33)
                                .onTapGesture {
                                    consoleMode = true
                                }
                            
                        } // end ScrollView
                    } // end GeometryReader
                    
                    ZStack {
                        Image(systemName: "keyboard")
                        StatsCalcView(consoleMode: $consoleMode, consoleBackground: $consoleBackground, text01: $text0, capsLockOn: $capsLockOn)
                            .frame(width: UIScreen.main.bounds.width*0.682, height: 25 ) // height: 228)
                            .opacity(0.05)
                            .onTapGesture {
                                consoleMode = true
                            }
                    } // ZStack
                    
                    HStack {
                        Spacer()
                        Button {
                            consoleMode.toggle()
                            
                        } label: {
                            if consoleMode {
                                Text(" CONSOLE MODE ")
                                    .background(.yellow)
                            }   else {
                                Text(" EDITOR MODE ")
                            }
                        } // end button label
                        
                        Spacer()
                        Button {
                            consoleBackground.toggle()
                            
                        } label: {
                            if consoleBackground {
                                Text(" Light ")
                            }   else {
                                Text(" Dark ")
                            }
                        } // end button label
                        
                        
                        Spacer()
                        Spacer()
                        
                        Image(uiImage: UIImage(named: "AppIcon") ?? UIImage())
                            .resizable()
                            .frame(width: 33.3, height: 22.8)
                        Spacer()
                    } // end HStack
                    
                    
                } // end VStack
                
                HStack {
                    Spacer()
                    
                    
                    Button {
                        getWebR = false
                        consoleMode = false
                        flag1 = false
                        flag2 = false
                        do {
                            server00.stop()
                            print("Server has stopped ( port = \(try server00.port()) ). Try to reconnect now...")
                            //    runningServer = true
                            
                            //      semaphore.wait()
                        } catch {
                            print("Server stop error: \(error)")
                            // semaphore.signal()
                        } // end catch
                        
                        
                    } label: {
                        Text("RESET")
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        // self.viewModel.goTerminal()
                        self.flag2 = false
                        self.flag1 = true
                        
                    }) {
                        Image(systemName: "pc").font(.title)
                        
                    }
                    
                    
                    Button(action: {
                        // self.viewModel.goGraphical()
                        self.flag1 = false
                        self.flag2 = true
                    }) {
                        Image(systemName: "chart.bar").font(.title)
                        
                    }
                    
                    
                    Spacer()
                    
                } // end HStack
                    
                    
            } // end sheet
        } // end HStack for online servers section
        
        // end webR section
        
        
        
        
        
    
       // jor1k-Linux version 0.1
 
        //        VStack {
        
        Spacer()
        /*
        Image(uiImage: UIImage(named: "AppIcon") ?? UIImage())
           .resizable()
           .frame(width: 33.3, height: 22.8)
        */
        
        Button {
                                     getShell01 = true
             print("Clicking button...\(getShell01) ... \(selectedLinux)")
                                 } label: {
                                     Text(" R\nLinux\nTerminal ")
                                         .font(.title2)
                                     //    .background(.yellow)
                                         .overlay(
                                       //      RoundedRectangle(cornerRadius: 8)
                                             Circle()
                                   //             .fill(.yellow)
                                                .frame(width: 150, height: 150)
                                         //       .background(.gray)
                                                .opacity(0.25)
                                           //      .stroke(Color.primary, lineWidth: 1)
                                             )
                                         .frame(width: 182.2, height: 122.8)

                                 }
                                 .sheet(isPresented: $getShell01) {
                                     
            //                                   ScrollView.init {
                                         
                                         
            //            VStack.init(alignment: .leading, spacing: nil, content: {
                                         VStack {
        
                                             GeometryReader.init { geometry in
            //                                     ScrollView.init {
            //             VStack.init(alignment: .leading, spacing: nil, content: {
 
                                                         webTerminal.frame(width: UIScreen.main.bounds.width*0.955, height: UIScreen.main.bounds.height) //*0.822 ) // 555)

                                          //           }) // VStack
              //                                   } // end ScrollView
                                             } // end GeometryReader
                                             Spacer()
                                 //            Spacer()
            //        GeometryReader.init { geometry in
            //            ScrollView.init {
            //                VStack.init(alignment: .leading, spacing: nil, content: {
  
        ShellEditor(consoleMode: $consoleMode, consoleBackground: $consoleBackground, text01: $text0, text03B: $text822, capsLockOn: $capsLockOn)
                                                 .frame(width: UIScreen.main.bounds.width*0.682, height:  28)
            .onTapGesture {
                consoleMode = true
            }
            .frame(width: UIScreen.main.bounds.width*0.822, height: 28) // 122.8)
  
                                             
                                        //             }) // VStack
                                        //         } // end ScrollView
                                         //    } // end GeometryReader

                                      //   }) // VStack
                                        // }  // end VStack ??
 
                                         
                                         HStack {
                                             Spacer()

                                             Button {
                                                 getShell01 = false
                                                 
                                                 
                                             } label: {
                                                 Text("Reset")
                                             }
                                       
                                       //  Spacer()
  
                                             Spacer()
                                                 Button {
                                           
                                                     getRplot = true
                                                 //    getFile1 = true
                                                     
                                                 } label: {
                                                     Text("Show PDF")
                                                 }
                                         Spacer()
                                             Button {
                                       
                                                 getRplot = true
                                                 viewModel.shouldShowShareSheet = true
                                                 
                                             } label: {
                                                 Text("Share PDF")
                                             }
                                     Spacer()
                                             

                                         Spacer()
                                        
                                        
                                     } // end Stack
                                         
                                     //    Spacer()
                                             
                                     //        Spacer()
                                         
                                         BottomBar(viewModel: viewModel) // new CODE
                                     } // end VStack ??
                                         
                                  //   } // end ScrollView
                                     .sheet(isPresented: $viewModel.shouldShowShareSheet) {
                                       //  if let url: URL = WKJavaScriptExceptionSourceURL
                                                
                            //             ShareSheet(activityItems: [viewModel.urlString.description])
                                                    
                                               
                          
                              
                         //                if let url: URL = URL(string: viewModel.urlString.description) {
                                 if let url: URL = URL(string: currentLoc) { // original code
                              //             let data = try? Data(contentsOf: url)
                                //           debugPrint("data-blob: \(data?.base64EncodedData())")
                                           if let data = try? Data(contentsOf: url) {
                                                           if let image = UIImage(data: data) {
                                                           //    debugPrint("image= \(image)")
                                               ShareSheet(activityItems:
                                                            [image.pngData() ?? Image(uiImage: UIImage(named: "AppIcon") ?? UIImage())
                                                                .resizable()
                                                                .frame(width: 33.3, height: 22.8)])
                                                           }} else {
                                            //   debugPrint("plotImage= \(plotImage)")
                                           ShareSheet(activityItems:
                                                        [plotImage.pngData() ?? Image(uiImage: UIImage(named: "AppIcon") ?? UIImage())
                                                            .resizable()
                                                            .frame(width: 33.3, height: 22.8)])
                                           }  // .dataRepresentation])//[(webTerminal.viewModel.webViewOptionsPublisher) as Any])
                                      //     [(webTerminal.viewModel.urlString.data(using: <#T##String.Encoding#>))! as NSData])
                                       } // end if let url
                                         
                                  
                                   
                                         
                                     
                                         
                                         
                                     } // end sheet
                                     Spacer()
            
        } // end VStack
        
        
        
        
        
    /*
     
     
     // jsLinux section
     
        VStack {
            
            
                        
            
            Button {
                                         getLinux = true
                 print("Clicking button...\(getShell02) ... \(selectedLinux)")
                                     } label: {
                                         Text(" Select jsLinux Configuration ").font(.title2)
                                 .background(.yellow)
                                     }
                                     .sheet(isPresented: $getLinux) {
                                         Spacer()
                                         ScrollView.init {
                                             VStack.init(alignment: .leading, spacing: nil, content: {
                                                 Spacer()
            Text("\tjsLinux Systems ").font(.title)
                                                 Spacer()
                        Picker("Select", selection: $selectedLinux) {
                            ForEach(options, id: \.self) {
                                Text($0)
                                    
                            }
                            .frame(width: 450)
                            .font(.title3)
                            
                        }
                        .frame(width: 450)
                                    .clipped()
                                    .font(.title2)
                .background(.yellow)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.primary, lineWidth: 1)
                    )
                                             }) // VStack
                                             Spacer()
                                             Spacer()

                                                 Button {
                                                     getLinux = false
                                                     
                                                     
                                                 } label: {
                                                     Text("Got it!").font(.title2)
                                                 }
                                                 
                                                 
                                         } // end ScrollView
                                             
                                        
                                         } // end sheet
            
            
        Spacer()
            Text(selectedLinux).font(.title2)
            Spacer()
            
        Button {
                                     getShell02 = true
             print("Clicking button...\(getShell02) ... \(selectedLinux)")
                                 } label: {
                                     Text(" Test jsLinux Terminal")
                                         .font(.title2)
                                     //    .background(.yellow)
                                         .overlay(
                                             RoundedRectangle(cornerRadius: 8)
                                                 .stroke(Color.primary, lineWidth: 1)
                                             )

                                 }
                                 .sheet(isPresented: $getShell02) {
                                     
                                     ScrollView.init {
                                         VStack.init(alignment: .leading, spacing: nil, content: {

                                             Text("\tjsLinux:")
                                             Text(">  \(selectedLinux)")
                                                 .background(.yellow)
                                      //       ZStack {
                                             LinuxTerm(text00: $text0, text03A: $text822, testJor1k: $getShell01, getJSLinux: $getShell02, getKerTeX: $getShell03, selectedLinux: $selectedLinux)
                                                 .frame(width: UIScreen.main.bounds.width, height: 228)
                                                 
                                             
                                           //      JSWebsite()
                                        //     Webview() // (url: URL(string: "cnn.com")!) // file://httpServer00.app/jslinux00/index.html")!)
                                             ShellEditor(consoleMode: $consoleMode, consoleBackground: $consoleBackground, text01: $text0, text03B: $text822, capsLockOn: $capsLockOn)
                                                             .frame(width: UIScreen.main.bounds.width)
                                                             .onTapGesture {
                                                                 consoleMode = true
                                                             }
                                         .frame(width: UIScreen.main.bounds.width, height: 228)
                                         .overlay(RoundedRectangle(cornerRadius: 4)
                                                 .stroke(Color.primary, lineWidth: 1)
                                             )
                                    
                                 
                                                 
                                       //      } // end ZStack

                                             
                                     }) // VStack

                                         Button {
                                             getShell02 = false
                                             
                                             
                                         } label: {
                                             Text("Home")
                                         }
                                         
                                         
                                 } // end ScrollView
                                     
                                     
                                 } // end sheet
        
    } // end VStack

         
*/
        Spacer()
        /*
        Image(uiImage: UIImage(named: "AppIcon") ?? UIImage())
           .resizable()
           .frame(width: 33.3, height: 22.8)
        */
        Button {
                                     getReadme = true
             
                                 } label: {
                                     Text(" README ")
                                         .font(.title3)
                                    //     .background(.yellow)
                                         .overlay(
                                             RoundedRectangle(cornerRadius: 8)
                                                 .stroke(Color.primary, lineWidth: 1)
                                             )

                                 }
                                 .sheet(isPresented: $getReadme) {
                                     
                                     ScrollView.init {
                                         VStack.init(alignment: .leading, spacing: nil, content: {

                                             Text(readme1)
                                                 .lineLimit(500)
                                                                         .padding(15)
                                                                         .frame (width:400) // .frame(minWidth: 0, maxWidth: .infinity)
                                                                         .background(Color(white: 0.8))
                                                                         .overlay(
                                                                             RoundedRectangle(cornerRadius: 8)
                                                                                 .stroke(Color.primary, lineWidth: 1)
                                                                         )
                             /*                Text(gotamail1)
                                                 .lineLimit(100)
                                                                         .padding(15)
                                                                         .frame (width:400) // .frame(minWidth: 0, maxWidth: .infinity)
                                                                         .background(Color(white: 0.8))
                                                                         .overlay(
                                                                             RoundedRectangle(cornerRadius: 8)
                                                                                 .stroke(Color.primary, lineWidth: 1)
                                                                         )
                              */
                                             Text(license1)
                                                 .lineLimit(777)
                                                                         .padding(15)
                                                                         .frame (width:400) // .frame(minWidth: 0, maxWidth: .infinity)
                                                                         .background(Color(white: 0.8))
                                                                         .overlay(
                                                                             RoundedRectangle(cornerRadius: 8)
                                                                                 .stroke(Color.primary, lineWidth: 1)
                                                                         )
                                         }) // VStack

                                             Button {
                                                 getReadme = false
                                                 
                                                 
                                             } label: {
                                                 Text("Back")
                                             }
                                         } // end ScrollView
                                             
                                             
                                         } // end sheet
                

        
 
    } //end some View
} // end struct


// Sources:
/*
 https://stackoverflow.com/questions/56505692/how-to-resize-image-with-swiftui
 https://stackoverflow.com/questions/58805852/how-can-i-make-a-background-in-swiftui-translucent
 https://www.hackingwithswift.com/quick-start/swiftui/how-to-adjust-the-opacity-of-a-view
 https://www.hackingwithswift.com/quick-start/swiftui/how-to-detect-device-rotation
 
 https://nemecek.be/blog/92/javascript-basics-for-ios-developers
 
 https://67443.cmuis.net/labs/3
 
 
 
 
 */
