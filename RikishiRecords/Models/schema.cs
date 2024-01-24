using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

public class Tournament
{
    public int TrournamentId { get; set; }
    
    public string Basho { get; set; }
    
    public DateTime TournamentStart { get; set; }
    
    public DateTime TournamentEnd { get; set; }
}

public class Wrestler
{
    public int WrestlerId { get; set; }

    public int Rank { get; set; }

    public string Shikona { get; set; }

    public string Heya { get; set; }

    public string Name { get; set; }

    public int TotalWins { get; set; }

    public int TotalLoss { get; set; }

    public string RingNameHistory { get; set; }

    public DateTime DateOfBirth { get; set; }

    public string PlaceOfBirth { get; set; }

    public int Height { get; set; }

    public double Weight { get; set; }

    public string FavoriteGripTechniques { get; set; }
}

public class Bout
{
    public int BoutId { get; set; }

    public string Kimarite { get; set; }

    public int Duration { get; set; }
}

public class Match
{
    public int MatchId { get; set; }

    public int TournamentId { get; set; }

    public DateTime MatchDate { get; set; }

    public int Wrestler1Id { get; set; }

    public int Wrestler2Id { get; set; }

    public int BoutId { get; set; }

    public bool Wrestler1Win { get; set; }

    public bool Wrestler2Win { get; set; }

    // Navigation properties
    public Tournament Tournament { get; set; }

    public Wrestler Wrestler1 { get; set; }

    public Wrestler Wrestler2 { get; set; }

    public Bout Bout { get; set; }
}

public class MediaReference
{
    public int MediaId { get; set; }

    public int WrestlerId { get; set; }

    public string MediaType { get; set; }

    public string ReferenceLink { get; set; }

    public string Description { get; set; }

    public DateTime DatePublished { get; set; }

    // Navigation property
    public Wrestler Wrestler { get; set; }
}

public class User
{
    public int UserId { get; set; }

    public string Username { get; set; }

    public string Email { get; set; }

    public string PasswordSalt { get; set; }

    public string PasswordHash { get; set; }

    public DateTime JoinDate { get; set; }
}

public class UserPrediction
{
    public int PredictionId { get; set; }

    public int UserId { get; set; }

    public int MatchId { get; set; }

    public int PredictedWinner { get; set; }

    public DateTime PredictionDate { get; set; }

    // Navigation properties
    public User User { get; set; }

    public Match Match { get; set; }

    public Wrestler PredictedWinnerWrestler { get; set; }
}

public class UserStats
{
    public int UserStatsId { get; set; }

    public int UserId { get; set; }

    public int TotalPoints { get; set; }

    public int TotalWins { get; set; }

    public int TotalLosses { get; set; }

    // Navigation property
    public User User { get; set; }
}

public class Discussion
{
    public int DiscussionId { get; set; }

    public int UserId { get; set; }

    public string Title { get; set; }

    public string Content { get; set; }

    public DateTime PostDate { get; set; }

    // Navigation property
    public User User { get; set; }
}

public class UserConnection
{
    public int ConnectionId { get; set; }

    public int User1Id { get; set; }

    public int User2Id { get; set; }

    public DateTime ConnectionDate { get; set; }

    // Navigation properties
    public User User1 { get; set; }

    public User User2 { get; set; }
}

public class Leaderboard
{
    public int LeaderboardId { get; set; }

    public int UserId { get; set; }

    public int TotalPoints { get; set; }

    public int Rank { get; set; }

    // Navigation property
    public User User { get; set; }
}

public class UserMediaContribution
{
    public int ContributionId { get; set; }

    public int UserId { get; set; }

    public int MediaId { get; set; }

    public string ContributionText { get; set; }

    public DateTime ContributionDate { get; set; }

    // Navigation properties
    public User User { get; set; }

    public MediaReference MediaReference { get; set; }
}
