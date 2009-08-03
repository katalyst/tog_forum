class ApplicationController < ActionController::Base
  helper do
    # this method seems to have been left out from the current version of tog_forum, so
    # we'll just call h() for now
    def white_list(x)
    	h(x)
    end
  end
end