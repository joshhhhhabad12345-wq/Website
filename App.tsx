import React, { useState } from 'react';
import { Background } from './components/Background';
import { Navbar } from './components/Navbar';
import { HomeView } from './components/HomeView';
import { ScriptView } from './components/ScriptView';
import { CommunityView } from './components/CommunityView';
import { ViewState } from './types';

function App() {
  const [currentView, setCurrentView] = useState<ViewState>('home');

  return (
    <div className="min-h-screen text-white font-sans selection:bg-blood-900 selection:text-white overflow-x-hidden">
      <Background />
      <Navbar currentView={currentView} onNavigate={setCurrentView} />
      
      <main className="pt-24 pb-12 px-4 container mx-auto relative z-10 flex flex-col min-h-screen">
        {currentView === 'home' && (
          <HomeView onNext={() => setCurrentView('script')} />
        )}
        
        {currentView === 'script' && (
          <ScriptView onNext={() => setCurrentView('community')} />
        )}
        
        {currentView === 'community' && (
          <CommunityView />
        )}
      </main>

      <footer className="absolute bottom-0 w-full py-4 text-center text-gray-600 text-xs uppercase tracking-widest z-10">
        &copy; {new Date().getFullYear()} Project X. All Rights Reserved.
      </footer>
    </div>
  );
}

export default App;