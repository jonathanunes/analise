require 'open-uri'

class Medida < ActiveRecord::Base
  belongs_to :evento

  def atualizar(evento)
    self.evento_id = evento.id
    getTwitter(evento.twitter)
    getAlexa(evento.alexa)
    getFacebook(evento.facebook)
    getInstagram(evento.instagram)
  end



  private

  def getInstagram(instagram)
      begin
        source = open("https://instagram.com/#{instagram}").read
        a = source.split('count')
        self.instagram = a[2].delete('"').delete(':').delete('}').delete(',').to_i || 0
      rescue => ex
        logger.error ex.message
      end
  end

  def getTwitter(twitter)
    begin
      source = open("https://twitter.com/#{twitter}").read
      a = source.split('<a class="ProfileNav-stat ProfileNav-stat--link u-borderUserColor u-textCenter js-tooltip js-nav u-textUserColor" title="')
      a = source.split('class="ProfileNav-item ProfileNav-item--followers"')
      self.twitter = a[1].split('title')[1].split(' ')[0].gsub!('=','').gsub!('"','').delete('.')
    rescue => ex
      logger.error ex.message
    end
  end

  def getAlexa(url)
    begin
    source = open("http://www.alexa.com/siteinfo/#{url}").read
    self.alexa = source.split('metrics-data align-vmiddle')[1].split('>')[2].split('<')[0].gsub!(',','.').gsub!("\n",'').gsub!(' ','').delete('.')
    rescue => ex
      logger.error ex.message
    end
  end

  def getFacebook(facebook)
    begin
      @graph = Koala::Facebook::API.new("CAACEdEose0cBABFrhZAqtpyXJBqoGkwoY9EbSVWPR7fCiXcH69RZBwHGCdRPnuLscogN2GMaWpaE8EvdK2CZBEO9ug0AESQ0RnbbDZAX5WDZBCXH1NfM3g1C15evLQ0mCXOZAOmlvzv6kRm3Bcg7CVew6ncR1ZCAxbZBkchVzdFmkKHG2rqWOQfjveUHnqqEzG6TPpp0KHhDY2AUjtHAzlpnccpgdbDQVv8ZD")
      code = @graph.get_object(facebook)
      getFacebookLikes(code)
      getFacebookTalk(code)
    rescue => ex
      logger.error ex.message
    end
  end

  def getFacebookLikes(code)
    self.flikes = code['likes']
  end

  def getFacebookTalk(code)
    self.ftalk = code['talking_about_count'].to_i
  end
end
