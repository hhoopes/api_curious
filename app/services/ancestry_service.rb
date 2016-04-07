class AncestryService < AndMeApiService
  def ancestry
    get("/ancestry")
  end
end
