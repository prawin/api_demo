class BooksController < ApplicationController
  # GET users/1/books
  # GET users/1/books.json
  def index
    @user = User.find(params[:user_id])
    @books = @user.books

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @books }
    end
  end

  # GET users/1/books/1
  # GET users/1/books/1.json
  def show
    @user = User.find(params[:user_id])
    @book = @user.books.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @book }
    end
  end

  # GET users/1/books/new
  # GET users/1/books/new.json
  def new
    @user = User.find(params[:user_id])
    @book = @user.books.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @book }
    end
  end

  # GET users/1/books/1/edit
  def edit
    @user = User.find(params[:user_id])
    @book = @user.books.find(params[:id])
  end

  # POST users/1/books
  # POST users/1/books.json
  def create
    @user = User.find(params[:user_id])
    @book = @user.books.build(params[:book])

    respond_to do |format|
      if @book.save
        format.html { redirect_to([@book.user, @book], :notice => 'Book was successfully created.') }
        format.json { render :json => @book, :status => :created, :location => [@book.user, @book] }
      else
        format.html { render :action => "new" }
        format.json { render :json => @book.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT users/1/books/1
  # PUT users/1/books/1.json
  def update
    @user = User.find(params[:user_id])
    @book = @user.books.find(params[:id])

    respond_to do |format|
      if @book.update_attributes(params[:book])
        format.html { redirect_to([@book.user, @book], :notice => 'Book was successfully updated.') }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @book.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE users/1/books/1
  # DELETE users/1/books/1.json
  def destroy
    @user = User.find(params[:user_id])
    @book = @user.books.find(params[:id])
    @book.destroy

    respond_to do |format|
      format.html { redirect_to user_books_url(user) }
      format.json { head :ok }
    end
  end
end
