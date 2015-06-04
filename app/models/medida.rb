require 'open-uri'

class Medida < ActiveRecord::Base
  belongs_to :evento

  def atualizar(evento)
    self.evento_id = evento.id
    getTwitter(evento.twitter)
    getAlexa(evento.alexa)
    getFacebook(evento.facebook)
  end



  private

  def getTwitter(twitter)
    source = open("https://twitter.com/#{twitter}").read
    a = source.split('<a class="ProfileNav-stat ProfileNav-stat--link u-borderUserColor u-textCenter js-tooltip js-nav u-textUserColor" title="')
    a = source.split('class="ProfileNav-item ProfileNav-item--followers"')
    self.twitter = a[1].split('title')[1].split(' ')[0].gsub!('=','').gsub!('"','').to_f

  end

  def getAlexa(url)
    source = open("http://www.alexa.com/siteinfo/#{url}").read
    self.alexa = source.split('metrics-data align-vmiddle')[1].split('>')[2].split('<')[0].gsub!(',','.').gsub!("\n",'').gsub!(' ','')
  end

  def getFacebook(facebook)
    source = open("https://graph.facebook.com/#{facebook}/").read
    code = JSON.parse(source)
    getFacebookLikes(code)
    getFacebookTalk(code)
  end

  def getFacebookLikes(code)
    self.flikes = code['likes']
  end

  def getFacebookTalk(code)
    self.ftalk = code['talking_about_count']
  end
end
