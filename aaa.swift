let testDrives = [

        ["start_time": "2018-01-01 10:00:00", "end_time": "2018-01-01 11:00:00"],

        ["start_time": "2018-01-01 10:30:00", "end_time": "2018-01-01 11:30:00"],

        ["start_time": "2018-01-01 10:45:00", "end_time": "2018-01-01 11:45:00"],

        ["start_time": "2018-01-01 09:00:00", "end_time": "2018-01-01 11:00:00"],

        ["start_time": "2018-01-01 10:00:00", "end_time": "2018-01-01 12:00:00"]

    ];

    

    

    func commanOverLap(drives: Array<Dictionary<String, Any>>) -> Dictionary<String, Any> {

        

        let dF = DateFormatter()

        dF.dateFormat = "yyyy-MM-dd HH:mm:ss"

        

        let dr1 = drives[0]

        let dr2 = drives[1]

        

        let dr1Start = dF.date(from: dr1["start_time"] as! String)

        let dr1Stop = dF.date(from: dr1["end_time"] as! String)

        

        let dr2Start = dF.date(from: dr2["start_time"] as! String)

        let dr2Stop = dF.date(from: dr2["end_time"] as! String)

        

        if dr1Start! >= dr2Start! && dr1Start! <= dr2Stop! {

            

            let startTime = dr1Start

            var stopTime : Date

            

            if dr1Stop! >= dr2Start! && dr1Stop! <= dr2Stop! {

                stopTime = dr1Stop!

            }

            else {

                stopTime = dr2Stop!

            }

            

            let dict = ["start_time": dF.string(from: startTime!), "end_time": dF.string(from: stopTime)]

            

            if drives.count > 2 {

                var passDrives = Array(drives[2..<drives.count])

                passDrives.insert(dict, at: 0)

                return commanOverLap(drives: passDrives)

            }

            else if drives.count == 2 {

                return dict

            }

        }

        else if dr2Start! >= dr1Start! && dr2Start! <= dr1Stop! {

            

            let startTime = dr2Start

            var stopTime : Date

            

            if dr2Stop! >= dr1Start! && dr2Stop! <= dr1Stop! {

                stopTime = dr2Stop!

            }

            else {

                stopTime = dr1Stop!

            }

            

            let dict = ["start_time": dF.string(from: startTime!), "end_time": dF.string(from: stopTime)]

            

            if drives.count > 2 {

                var passDrives = Array(drives[2..<drives.count])

                passDrives.insert(dict, at: 0)

                return commanOverLap(drives: passDrives)

            }

            else if drives.count == 2 {

                return dict

            }

        }

        

        return [:]

    }



    print(commanOverLap(drives: testDrives))


