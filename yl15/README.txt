/**********************************************************************/
/*  YL 1.5 - A template for the weblog engine                         */
/*  Serendipity                  <http://www.s9y.org>                 */
/*  by Matthias 'YellowLed' Mees <http://www.yellowled.de>            */
/**********************************************************************/

This is my fifth template for Serendipity (s9y), and since it might
require some modifications before you can use it, I decided to write
this little README file.


* What is this?

Basically, YL 1.5 is a flexible, tableless template, which means:

  - you can choose between a 3-column or 2-column layout simply by using
    either one or both sidebars in the admin panel under 'Configure
    Plugins' -> 'Sidebar Plugins'; if you choose to only use the left or
    the right sidebar, you can use either one of them

  - this template does not use tables for layout purposes if possible;
    the only exceptions are the calendar and the archive; the basic page
    structure as well as comment form and contact form don't use any
    tables for layout purposes


* Can I use this with any version of s9y?

Basically yes. YL 1.5 has been developed using s9y v1.1 in order to use
some of the advanced features introduced in that particular version
(i.e. the theme configurator), but it is also backwards compatible, so
you should be able to use it with versions below v1.1 -- however, I
strongly recommend to use it with v1.1. You'll be missing key features
in earlier versions. I'll make sure to point those out in the following.


* Key features?

The obvious feature of this theme is that it uses the new theme
configurator introduced with s9y v1.1. This gives template developers
the option to present users some 'Theme/Style options' which they can
configure in the admin panel using 'Manage Styles'. Once this template
is installed and set as the template to use, you'll find the following
options (remember, you'll only see these in a blog using s9y => v1.1!):

  - Color choice

    This template comes with four (actually five) different colorsets:

      - 'YellowLed', which is the colorset I use in my personal blog
      - 'Robert Lender', a colorset for, right, Robert Lender, who asked
        me to do a template for his personal blog
      - 'The Matrix', a colorset based on the visuals of the eponymous
        blockbuster movie trilogy 
      - 'Pirates!', a colorset I've been meaning to do for quite some
        time now featuring a tropical color scheme and a Jolly Roger
        flag (but no buddle of rum, I'm sorry ;-))
      - 'My colorset' -- explained further below

     Note: In s9y < 1.1, the colorset 'YellowLed' is used.

   - Position of Entry Footer

     You can choose whether the entry footer (i.e. the info on author,
     comments, trackbacks etc.) will be displayed below the actual entry
     or split into two lines - an author byline right under the entry
     title and the rest of the footer below the entry text.

     Note: In s9y < 1.1, the footer below the article is used.

   - Integrate coComment

     Choose whether or not to integrate coComment
     (http://www.cocomment.com) support for your comment forms.

     Note: In s9y < 1.1, coComment support is active. You can remove it
     by editing commentform.tpl, see comments there for details.

   - Counter code

     This box can be used to insert i.e. javascript code for a counter
     or another statistics tool. The code will be inserted into the page
     footer.

   - Footer text

     This box can be used to insert additional text into the page
     footer.

     Note: In s9y < 1.1, both counter code and footer text are not used
     at all -- sorry, but it's simply pointless if there's no interface
     to edit those.

   - Navbar links

     The last part of the 'Theme/Style options' is used to configure the
     additional navigation bar sitting right under the header. You can
     configure the number of links in this navbar (don't overwind it, it
     might look ugly!), the link text, and the actual link for each
     navbar link.

     Changing the number of navbar links usually requires to save the
     'Theme/Style options' and reload the page, you'll figure it out :-)

     Note: In s9y < 1.1, the navbar links are hardcoded into the
     index.tpl. You can change them by editing this file, see comments
     there for details.


* I want to use this, but I want to do some customization. Is that
  possible?

Of course. But I strongly advise to do it 'the right way': There is a
fifth colorset called 'My colorset'. Switch your blog to this colorset
and enter your customizations in the file mc.css.

Please do *not* edit the file style.css -- you can overwrite anything
you want to see different in your blog using mc.css instead, thanks to
the css cascade, styles inserted there will overwrite those in the
style.css.

Now, if you do actually add your own customizations, I assume you have
at least basic knowledge of HTML and CSS. Because in my book, you
wouldn't be doing this if you didn't know HTML/CSS at least a little. So
I'll skip the very basic parts like how to change colors, fonts,
font-sizes and so on and get right to some parts of this particular
template that can be a little bit 'tricky':

   - Changing the body background-color

     Usually no biggie, but in this case, the body background-color is
     also involved in the rounded corners. So if you change the
     background-color for body, you'll have to create new versions of
     the rounded_*.gif files matching the new color. Make sure not to
     overwrite any of the old files.

   - Losing the rounded corners

     Piece of cake. Copy the 'rounded corners' part to mc.css and set
     every single one of those 4 backgrounds to 'background: none;'.

   - Changing the header image

     Basically simple, you can use any image you want. Just remember two
     things: The part of the image that is actually displayed is
     determined by at least two factors: the width for #mainpane (setting
     the overall width for the blog's content) and the height for
     #serendipity_banner. Depending on the exact dimensions of the image
     you want to use, positioning of the image could be a factor too.

   - Changing the columns width

     That's already documented in comments in rl.css.


* I have a question this README does not answer. What do I do?

You can contact me via email (<blog@yellowled.de>) or ask in the s9y
forums ('Themes' forum preferably; see <http://www.s9y.org/forums/>).

I promise you'll find a friendly and competent community in those forums
willing and trying to help you. Those guys might also be faster than me
in some cases :-)


* FAQ

   1. Q: The colorset 'YellowLed' has little arrows next to external
     links. Those are nice, but I don't want them next to image links
     (i.e. <a href="..."><img ... /></a>), how do I do that?

      A: Add: class="noextarrow" to those links. This class suppresses
      the external link arrow.


* Anything else?

Yeah -- if you have done some kind of modification of this template,
please contact me: <blog@yellowled.de>


/**********************************************************************/
/*  YL, 06-12-2006                                                    */
/**********************************************************************/
