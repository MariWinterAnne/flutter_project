import 'chat_data_list_model.dart';

class ChatDataModel {
  ChatDataModel({
    this.titles = const <String>[
      'All chats',
      'Personal',
      'Others',
    ],
    this.chatDataList = const <ChatDataListModel>[
      ChatDataListModel(
        id: 0,
        linkUrl: 'assets/images/1.png',
        title: 'Title',
        subtitle: 'Description',
        time: '19:00',
        unreadMessages: '11',
        text: '',
        cardImageLink: 'https://i.ytimg.com/vi/--PQXg_mx9I/maxresdefault.jpg',
        type: 'Personal',
      ),
      ChatDataListModel(
        id: 1,
        linkUrl: 'assets/images/2.png',
        title: 'Title2',
        subtitle: 'Description2',
        time: '23:06',
        unreadMessages: null,
        text:
            "A material widget that's displayed at the bottom of an app for selecting among a small number of views, typically between three and five."
            "There is an updated version of this component, NavigationBar, that's preferred for new applications and applications that are configured for Material 3 (see ThemeData.useMaterial3)."
            'The bottom navigation bar consists of multiple items in the form of text labels, icons, or both, laid out on top of a piece of material. It provides quick navigation between the top-level views of an app. For larger screens, side navigation may be a better fit.'
            'A bottom navigation bar is usually used in conjunction with a Scaffold, where it is provided as the Scaffold.bottomNavigationBar argument.'
            "The bottom navigation bar's type changes how its items are displayed. If not specified, then it's automatically set to BottomNavigationBarType.fixed when there are less than four items, and BottomNavigationBarType.shifting otherwise."
            "The length of items must be at least two and each item's icon and label must not be null."
            "BottomNavigationBarType.fixed, the default when there are less than four items. The selected item is rendered with the selectedItemColor if it's non-null, otherwise the theme's ColorScheme.primary color is used for Brightness.light themes and ColorScheme.secondary for Brightness.dark themes. If backgroundColor is null, The navigation bar's background color defaults to the Material background color, ThemeData.canvasColor (essentially opaque white)"
            "BottomNavigationBarType.shifting, the default when there are four or more items. If selectedItemColor is null, all items are rendered in white. The navigation bar's background color is the same as the BottomNavigationBarItem.backgroundColor of the selected item. In this case it's assumed that each item will have a different background color and that background color will contrast well with white"
            'Updating to NavigationBar'
            "The NavigationBar widget's visuals are a little bit different, see the Material 3 spec at m3.material.io/components/navigation-bar/overview for more details."
            "The NavigationBar widget's API is also slightly different. To update from BottomNavigationBar to NavigationBar, you will need to make the following changes."
            'Instead of using BottomNavigationBar.items, which takes a list of BottomNavigationBarItems, use NavigationBar.destinations, which takes a list of widgets. Usually, you use a list of NavigationDestination widgets. Just like BottomNavigationBarItems, NavigationDestinations have a label and icon field.'
            'Instead of using BottomNavigationBar.onTap, use NavigationBar.onDestinationSelected, which is also a callback that is called when the user taps on a navigation bar item.'
            'Instead of using BottomNavigationBar.currentIndex, use NavigationBar.selectedIndex, which is also an integer that represents the index of the selected destination.'
            'You may also need to make changes to the styling of the NavigationBar, see the properties in the NavigationBar constructor for more details.',
        cardImageLink: 'https://i.ytimg.com/vi/jHKHX959V20/mqdefault.jpg',
        type: 'Others',
      ),
      ChatDataListModel(
        id: 2,
        linkUrl: 'assets/images/3.png',
        title: 'Title3',
        subtitle: 'Description3',
        time: '13:51',
        unreadMessages: null,
        text: '',
        cardImageLink: 'https://i.ytimg.com/vi/Gu-rIu6Zw9w/maxresdefault.jpg',
        type: 'Personal',
      ),
      ChatDataListModel(
        id: 3,
        linkUrl: 'assets/images/4.png',
        title: 'Title4',
        subtitle: 'Description4',
        time: '07:40',
        unreadMessages: '1',
        text: '',
        cardImageLink:
            'https://i.pinimg.com/originals/25/c7/53/25c753e58b453f69924874177ebafb30.jpg',
        type: 'Others',
      ),
      ChatDataListModel(
        id: 4,
        linkUrl: 'assets/images/5.png',
        title: 'Title5',
        subtitle: 'Description5',
        time: '00:17',
        unreadMessages: null,
        text: '',
        cardImageLink: 'https://i.ytimg.com/vi/0RHKayaQtFQ/maxresdefault.jpg',
        type: 'Personal',
      ),
      ChatDataListModel(
        id: 5,
        linkUrl: 'assets/images/6.png',
        title: 'Title6',
        subtitle: 'Description6',
        time: '16:03',
        unreadMessages: null,
        text: '',
        cardImageLink: 'https://i.ytimg.com/vi/PSjddHiR6nY/maxresdefault.jpg',
        type: 'Others',
      ),
      ChatDataListModel(
        id: 6,
        linkUrl: 'assets/images/7.png',
        title: 'Title7',
        subtitle: 'Description7',
        time: '19:00',
        unreadMessages: null,
        text: '',
        cardImageLink: null,
        type: 'Personal',
      ),
    ],
  });

  final List<String> titles;
  final List<ChatDataListModel> chatDataList;
}
