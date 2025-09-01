import './App.css';
import { ActivityCalendar } from 'react-activity-calendar';
import 'react-activity-calendar/tooltips.css';
import { calendarProps } from '../../props.ts';

function App() {
  return (
    <>
      <h3>Vite</h3>
      <ActivityCalendar {...calendarProps} />
    </>
  );
}

export default App;
