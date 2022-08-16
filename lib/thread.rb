module Streak
  class Thread < StreakObject
    def self.all(box_key, params = {})
      path = "/boxes/#{box_key}/threads"
      res = Streak.request(:get, path, params)
      convert_to_streak_object(res, Thread)
    end

    def self.put_into_box(thread_gmail_id, box_key)
      path = "/boxes/#{box_key}/threads"
      res = Streak.request(:put, path,
                            { "boxKey": box_key, "threadGmailId": thread_gmail_id },
                            content_type: 'application/x-www-form-urlencoded')
      convert_to_streak_object(res, Thread)
    end
  end
end
