import './App.css';
import { ActivityCalendar } from 'react-activity-calendar';
import 'react-activity-calendar/tooltips.css';
import { calendarData } from '../../config.ts';

function App() {
  return (
    <>
      <h3>Vite</h3>
      <ActivityCalendar
        data={calendarData}
        theme={{ light: ['#eee', 'violet'] }}
        tooltips={{
          activity: {
            text: (activity) =>
              `${activity.count} activities on ${activity.date}`,
            withArrow: true,
          },
        }}
      />
    </>
  );
}

export default App;
