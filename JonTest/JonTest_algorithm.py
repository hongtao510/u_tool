# -*- coding: utf-8 -*-
"""
Created on Tue Jan 03 13:30:41 2012

@author: jharston
"""

import webapp2 as webapp
from google.appengine.ext.webapp.util import run_wsgi_app
from google.appengine.ext.webapp import template
import os

class genericAlgorithmPage(webapp.RequestHandler):
    def get(self):
        templatepath = os.path.dirname(__file__) + '/../templates/'
        html = template.render(templatepath + '01hh_uberheaderJon.html', {'title'})
        html = html + template.render(templatepath + '02hh_uberintroblock_wmodellinks.html', {'model':'JonTest','page':'algorithm'})
        html = html + template.render(templatepath + '03hh_ubertext_links_left.html', {})                       
        html = html + template.render(templatepath + '04ubertext_start.html', {
                'model':'JonTest', 
                'model_attributes':'JonTest Algorithms', })
        html = html + template.render(templatepath + '04ubertext_end.html', {})
        html = html + template.render(templatepath + '05hh_ubertext_links_right.html', {})
        html = html + template.render(templatepath + '06hh_uberfooter.html', {'links': ''})
        self.response.out.write(html)

app = webapp.WSGIApplication([('/.*', genericAlgorithmPage)], debug=True)

def main():
    run_wsgi_app(app)

if __name__ == '__main__':
    main()
    