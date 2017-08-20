//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

enum ProfileSection: Int {
    case Time, WarmUp, CoolDown, Count

    static var count = {
        return ProfileSection.Count.rawValue
    }

    static let sectionTitles = [
        Time: "Time",
        WarmUp: "Warm Up",
        CoolDown: "Cool Down"
    ]

    func sectionTitle() -> String {
        if let sectionTitle = ProfileSection.sectionTitles[self] {
            return sectionTitle
        } else {
            return ""
        }
    }
    
}
// let x = ProfileSection(rawValue: 1)

func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return ProfileSection.count()
}

func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    guard let section = ProfileSection(rawValue: section) else { return 1 }

    switch section {
    default: return 1
    }
}

func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    guard let section = ProfileSection(rawValue: section) else { return "" }
    return section.sectionTitle()
}


class ProfileViewModel {

//    let profile: Profile
//
//    // MARK - Initialization
//
//    init(withProfile profile: Profile) {
//        self.profile = profile
//    }
    
}

private func cellForTimeSectionForRowAtIndexPath( _ indexPath: NSIndexPath) -> UITableViewCell {
//    guard let cell = tableView.dequeueReusableCellWithIdentifier(profileDefaultTableViewCell, forIndexPath: indexPath) as? ProfileTableViewCell else {
        return UITableViewCell()
//    }
//
//    cell.detailTextLabel?.text = ""
////    cell.textLabel?.text = profileViewModel.timeForProfile()
//
//    return cell
}

func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    guard let section = ProfileSection(rawValue: indexPath.section) else { return UITableViewCell() }

    switch section {
    case .Time:
        return cellForTimeSectionForRowAtIndexPath(indexPath)
    default:
        return UITableViewCell()
    }
}
