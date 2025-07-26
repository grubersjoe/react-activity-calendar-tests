import './App.css';
import { ActivityCalendar } from 'react-activity-calendar';
import 'react-activity-calendar/tooltips.css';

const data = [
  {
    date: '2023-06-01',
    count: 2,
    level: 1,
  },
  {
    date: '2023-07-01',
    count: 16,
    level: 4,
  },
  {
    date: '2024-04-01',
    count: 16,
    level: 3,
  },
];

function App() {
  return (
    <>
      <h3>Vite</h3>
      <ActivityCalendar
        data={data}
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
