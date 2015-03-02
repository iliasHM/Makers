class PagesController < ApplicationController
skip_before_action :authenticate_user!

  def home
    @workshops = Workshop.all

    @markers = Gmaps4rails.build_markers(@workshops) do |workshop, marker|
      marker.lat workshop.latitude
      marker.lng workshop.longitude
      marker.title workshop.maker.name
      # marker.infowindow user.owner_of
      # marker.picture({
      #   url: 'https://s3-eu-west-1.amazonaws.com/rock-my-pet-pix/paw.svg?X-Amz-Date=20150220T112444Z&X-Amz-Expires=300&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Signature=ed12c2cfede8f98ad3bcfd231c6c808955c8f3da5ea8dd52f0180beac63a4690&X-Amz-Credential=ASIAJL37ZWUWXJXZFZ2Q/20150220/eu-west-1/s3/aws4_request&X-Amz-SignedHeaders=Host&x-amz-security-token=AQoDYXdzEHMakAIc443w7SHNGAO113WIqm9t2wgwYeKwh2MaLXAfdhH2mIxFXS7DtfPiZWdI0tA/Y%2BDGF9p2a%2Bbe3oGNEQxXgWNPVpM/RfPYgT4zNcrXAgML0wk%2BME88qaZ/1T%2BwdcV9m53fWT38%2B%2BKVvIxOj2Fyp/gKIIC7Y9dPx6UQwJQPZh%2BJimVvU1Ubcccp51/OtwQDJx26kJHCJvNPeLzuv5GVNp%2BQtZt%2Blw2TjP82aoCKnBVGjn5XazpC6R/jHKLHDaaAA%2Bxmz/w%2ByYpXt3229Uw0Sb2nsb/RBWkvjtpq%2BGCsMcIJdtMuVxbVSOOS5fokww2YhS81KvnlYDzyjZQp8b7ppgKuHy6aKo6Q0cGEBRV2F6UlVCCKkpynBQ%3D%3D',
      #   width: 32,
      #   height: 32,
      #   })
    end
  end

  def credits
  end
end
