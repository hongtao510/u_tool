# -*- coding: utf-8 -*-
"""
Created on Tue Jan 03 13:30:41 2012

@author: jharston
"""

import webapp2 as webapp
from google.appengine.ext.webapp.util import run_wsgi_app
from google.appengine.ext.webapp import template
import os
from uber import uber_lib

class SIPReferencesPage(webapp.RequestHandler):
    def get(self):
        text_file1 = open('sip/sip_references.txt','r')
        x = text_file1.read()
        templatepath = os.path.dirname(__file__) + '/../templates/'
        ChkCookie = self.request.cookies.get("ubercookie")
        html = uber_lib.SkinChk(ChkCookie, "SIP References")
        html = html + template.render(templatepath + '02uberintroblock_wmodellinks.html', {'model':'sip','page':'references'})
        html = html + template.render(templatepath + '03ubertext_links_left.html', {})
        html = html + template.render(templatepath + '04uberreferences_start.html', {
                'model':'sip', 
                'model_attributes':'SIP References', 
                'text_paragraph':x})
        html = html + template.render(templatepath + '04ubertext_end.html', {})
        html = html + template.render(templatepath + '05ubertext_links_right.html', {})
        html = html + template.render(templatepath + '06uberfooter.html', {'links': ''})
        self.response.out.write(html)

app = webapp.WSGIApplication([('/.*', SIPReferencesPage)], debug=True)

def main():
    run_wsgi_app(app)

if __name__ == '__main__':
    main()
    