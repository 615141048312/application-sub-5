class SearchController < ApplicationController
	def search
		@user_or_book = params[:option]
		if @user_or_book == "user"
			@users = User.where('name LIKE ?', "%#{params[:search]}%")
		end
		if @user_or_book == "book"
			@books = Book.where('body LIKE ?', "%#{params[:search]}%")
		end
	end

	def perfect_search
	end
end
