class Article < ActiveRecord::Base
#pelo migration se setar attr_accessor :title,:description vai dar override nos getters e setters já feitos e o save no banco não ira funcionar
end
