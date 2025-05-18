Config = {}

Config.NPC = {
    {
        id = "npc1",
        coords = vector4(-251.0807, -968.1198, 31.2156, 244.1078),
        model = 'u_m_y_baygor',
        destinations = { "Keskimaa", "Pohjonen" }
    },
    {
        id = "npc2",
        coords = vector4(-166.8582, 6439.7563, 31.9159, 131.7567),
        model = 'u_m_y_baygor',
        destinations = { "Poliisiasema", "Hotelli" }
    },
    {
        id = "npc3",
        coords = vector4(1701.5342, 3757.9048, 34.3858, 312.9416),
        model = 'u_m_y_baygor',
        destinations = { "Poliisiasema", "Hotelli", "Sairaala" },
        walkSpawn = vector4(1709.8862, 3768.2427, 34.3488, 330.3590)
    }
}

Config.FastTravel = {
    price = 10000,
    destinations = {
        {
            label = "Keskimaa",
            desc = "Matkusta Keskimaahan nopeasti\nHinta: 10000 euroa",
            coords = vector4(1702.5581, 3752.4307, 34.3480, 204.4605),
            taxiSpawn = vector4(-235.1212, -984.4836, 29.1359, 159.2886),
            image = "https://i.postimg.cc/FFyFc167/N-ytt-kuva-2025-05-16-145540.png",
            icon = "taxi"
        },
        {
            label = "Pohjonen",
            desc = "Matkusta Pohjoseen nopeasti\nHinta: 10000 euroa",
            coords = vector4(-181.8111, 6433.2524, 31.9138, 22.5408),
            taxiSpawn = vector4(-235.1212, -984.4836, 29.1359, 159.2886),
            image = "https://i.postimg.cc/Fs5jhPfw/N-ytt-kuva-2025-05-16-150555.png",
            icon = "taxi"
        },
        {
            label = "Poliisiasema",
            desc = "Matkusta poliisiasemalle nopeasti\nHinta: 10000 euroa",
            coords = vector4(415.2193, -989.2490, 29.4168, 335.5093),
            taxiSpawn = vector4(-183.9834, 6442.7861, 31.0954, 74.7430),
            image = "https://i.postimg.cc/sg6bqm78/83064242836754455f07bf52cea132478e011b03.jpg",
            icon = "shield"
        },
        {
            label = "Hotelli",
            desc = "Matkusta hotellille nopeasti\nHinta: 10000 euroa",
            coords = vector4(-258.6424, -978.4811, 31.2200, 344.8680),
            taxiSpawn = vector4(-183.9834, 6442.7861, 31.0954, 74.7430),
            image = "https://i.postimg.cc/fRC0NtR1/N-ytt-kuva-2025-05-16-154146.png",
            icon = "bed"
        },
        {
            label = "Sairaala",
            desc = "Matkusta sairaalaan nopeasti\nHinta: 10000 euroa",
            coords = vector4(296.8243, -583.8056, 43.1339, 74.3116),
            taxiSpawn = vector4(1709.8862, 3768.2427, 34.3488, 330.3590),
            image = "https://i.postimg.cc/XvXkqSXj/b18bfe0e8a7291cf58f8496408fa0a2c45661b0c.jpg",
            icon = "hospital"
        }
    }
}
