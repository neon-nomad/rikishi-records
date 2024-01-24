namespace RikishiRecords.Components.Data;

// SumoData.cs

using System.Collections.Generic;

public class SumoData
{
    public string Name { get; set; }
    public string ImageUrl { get; set; }

    
    // mock data
    public static List<SumoData> GetSumoList()
    {
        return new List<SumoData>
        {
            new SumoData { Name = "Sumo Wrestler 1", ImageUrl = "https://placehold.co/250x300" },
            new SumoData { Name = "Sumo Wrestler 2", ImageUrl = "https://placehold.co/250x300" },
            new SumoData { Name = "Sumo Wrestler 3", ImageUrl = "https://placehold.co/250x300" },
            new SumoData { Name = "Sumo Wrestler 3", ImageUrl = "https://placehold.co/250x300" },
            new SumoData { Name = "Sumo Wrestler 3", ImageUrl = "https://placehold.co/250x300" },
            new SumoData { Name = "Sumo Wrestler 3", ImageUrl = "https://placehold.co/250x300" },
            new SumoData { Name = "Sumo Wrestler 3", ImageUrl = "https://placehold.co/250x300" },
        };
    }
}
