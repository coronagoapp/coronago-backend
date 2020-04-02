module Sessions
  module Duration
    def self.in_minutes(session)
      ((session.end_time - session.start_time) / 1.minutes).round
    end

    def self.in_seconds(session)
      (session.end_time - session.start_time).round
    end

    def self.update_user_session_duration(user, session)
      seconds = self.in_seconds(session)
      if session.session_type == 'home'
        user.update_columns(home_duration_in_seconds: user.home_duration_in_seconds + seconds)
      elsif session.session_type == 'away'
        user.update_columns(away_duration_in_seconds: user.away_duration_in_seconds + seconds)
      end
    end
  end
end
