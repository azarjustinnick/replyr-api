defmodule ReplyrApiWeb.HomeController do
  use ReplyrApiWeb, :controller

  def index(conn, _params) do
    text(conn,
"
                   _          
    ,_   _  ,_    //       ,_ 
  _/ (__(/__/_)__(/__(_/__/ (_
           /         _/_      
          /         (/        
")
  end
end