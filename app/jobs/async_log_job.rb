class AsyncLogJob < ApplicationJob
  queue_as do
    case self.arguments.first[:message]
    when "to async_log"
      :async_log
    else
      :default
    end
  end

  def perform(message: "hello") # message引数を追加
    AsyncLog.create!(message: message) # DBに保存する
  end
end