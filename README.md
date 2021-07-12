# Zadanie testowe
Lipiec 2021
<br> 

## Realizacja zadania:
Projekt został podzielony na 3 części.<br> 
Poszczególne kontrolery są obsługiwane przez *RootCoordinator*.<br> 

### 1. Splash Screen
- kontroler *SplashScreenViewController* zostaje utworzony jako pierwszy
- jego zadaniem jest pobranie danych z API
- UI tego kontrolera to kopia *LaunchScreen* + wskaźnik pobierania informujący usera o wykonywanej aktualnie akcji
- w związku z tym, że dane są kluczowe do dalszego działania aplikacji, to przejście do kolejnego ekranu jest możliwe wyłącznie po udanym ich pobraniu
- w sytuacji wystąpienia błędu związanego z networkingiem lub dekodowaniem danych, user zostanie powiadomiony o tym i dostanie możliwość powtórzenia requestu
- za warstwę networkingu odpowiada prosty serwis oparty o **URLSession** - w projekcie korzystamy tylko z jednego endpoint’u i jednego typu zapytania, nie było więc potrzeby tworzenia bardziej rozbudowanego rozwiązania

### 2. Main Screen
- zadaniem tego kontrolera jest prezentowanie pobranych danych oraz ich odświeżanie
- do prezentacji danych został wykorzystany komponent  **UITableView**, który z powodzeniem mógłby zostać zastąpiony poprzez *UICollectionView*, dający znacznie większe możliwości wizualnego pokazania danych
- zastosowanie *UITableView* daje możliwość skorzystania z *UIRefreshControl*, które wykorzystałem do odświeżenia danych
- podczas wykonywania requestu o nowe dane celowo blokuję UI, gdyż pobrane dane nie są dodawane do listy - zastępują je
- wskazanie przez usera pozycji na liście powoduje przesłanie do koordynatora informacji o tym wraz z adresem url, który jest powiązany z danymi - to koordynator decyduje o tym, co się dalej wydarzy po wystąpieniu takiego zdarzenia

### 3. Web Page Screen
- jedynym zadaniem *WebPageViewController’a* jest, wykorzystując przekazany mu link, pobranie związanej z nim strony i wyświetlenie jej
- w sytuacji wystąpienia błędu user oraz koordynator zostają powiadomieni o tym, a sam kontroler zostanie zamknięty

## UI:
Ekrany pierwszego i drugiego kontrolera zostały utworzone w ten sam sposób - z wykorzystaniem Xib’ów zbudowanych w IB.<br> 
Ekran trzeci został zaimplementowany całkowicie w kodzie. Obsługę auto-layoutu wspiera **SnapKit**.


## Dependencies:
W projekcie celowo zrezygnowałem z korzystania z CocoaPods - dodawanie zewnętrznych bibliotek zrealizowałem poprzez **SPM**.<br> <br> 
Wykorzystane są dwie biblioteki, choć bez problemu mogłem poradzić sobie bez nich bazując na natywnych rozwiązaniach.
Zrobiłem to jednak, aby zademonstrować, umiejętność korzystania z zewnętrznych rozwiązań.<br> <br> 
- **Kingfisher** - wspiera proces pobierania obrazków i ich cache’owanie<br> 
- **SnapKit** - upraszcza tworzenie w kodzie layout’u widoków i komponentów UI




