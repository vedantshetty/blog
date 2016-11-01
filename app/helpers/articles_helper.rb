module ArticlesHelper
def article_params
  params.require(:article).permit(:text, :body)
end
end
