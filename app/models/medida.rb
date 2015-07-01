require 'open-uri'

class Medida < ActiveRecord::Base
  belongs_to :evento

  def atualizar(evento)
    self.evento_id = evento.id
    getTwitter(evento.twitter)
    getAlexa(evento.alexa)
    getFacebook(evento.facebook)
    getInstagram(evento.instagram)
    getYoutube(evento.youtubeId)
  end



  private

  def getInstagram(instagram)
      if instagram
        begin
          source = open("https://instagram.com/#{instagram}").read
          a = source.split('count')
          self.instagram = a[2].delete('"').delete(':').delete('}').delete(',').to_i || 0
        rescue => ex
          logger.error ex.message
        end
      else
        self.instagram = 0
      end
  end

  def getTwitter(twitter)
    begin
      source = open("https://twitter.com/#{twitter}").read
      a = source.split('<a class="ProfileNav-stat ProfileNav-stat--link u-borderUserColor u-textCenter js-tooltip js-nav u-textUserColor" title="')
      a = source.split('class="ProfileNav-item ProfileNav-item--followers"')
      self.twitter = a[1].split('title')[1].split(' ')[0].gsub!('=','').gsub!('"','').delete('.') || 0
    rescue => ex
      logger.error ex.message
    end
  end

  def getAlexa(url)
    begin
    source = open("http://www.alexa.com/siteinfo/#{url}").read
    self.alexa = source.split('metrics-data align-vmiddle')[1].split('>')[2].split('<')[0].gsub!(',','.').gsub!("\n",'').gsub!(' ','').delete('.') || 0
    rescue => ex
      logger.error ex.message
    end
  end

  def getFacebook(facebook)
    begin
      @graph = Koala::Facebook::API.new(ENV['FACEBOOK_ACCESS'])
      code = @graph.get_object(facebook)
      getFacebookLikes(code)
      getFacebookTalk(code)
    rescue => ex
      logger.error ex.message
    end
  end

  def getFacebookLikes(code)
    self.flikes = code['likes'] || 0
  end

  def getFacebookTalk(code)
    self.ftalk = code['talking_about_count'].to_i || 0
  end

  def getYoutube(code)
    begin
      @http = Curl.get("https://www.googleapis.com/youtube/v3/channels?part=statistics&id=#{code}&key=#{ENV['GOOGLE_API_KEY']}")
      @response = JSON.parse(@http.body)
    rescue => ex
      logger.error
    end
    self.youtubeSubscribers = @response["items"][0]["statistics"]["subscriberCount"].to_i || 0
    self.youtubeViews = @response["items"][0]["statistics"]["viewCount"].to_i || 0
  end
end
