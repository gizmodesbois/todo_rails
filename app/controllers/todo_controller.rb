class TodoController < ApplicationController

    def index
        @todos = Todo.where(done: false)
        @todone = Todo.where(done: true)
    end

    def show
        @todo = Todo.find(params[:id])
    end

    def new
        @todo = Todo.new
    end

    def todo_params
        params.require(:todo).permit(:name, :description, :done)
    end

    def create
        @todo = Todo.new(todo_params)

        if @todo.save
            redirect_to todo_index_path, :success => 'Your todo has been created with success!'
        else
            render "new"
        end
    end

    def update
        @todo = Todo.find(params[:id])

        if @todo.update_attribute(:done, true)
            redirect_to todo_index_path, :notice => 'Your todo has been set to done'
        else
            redirect_to todo_index_path, :notice => 'Your todo has not been marked has done'
        end
    end

    def destroy
        @todo = Todo.find(params[:id])
        @todo.destroy

        redirect_to todo_index_path, :notice => 'Your todo has been removed with success!'
    end

end