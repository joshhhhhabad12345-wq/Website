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
    <div className="min-h-screen text-white font-sans selection:bg-blood-900 selection:text-white overflow-x-hidden flex flex-col">
      <Background />
      <Navbar currentView={currentView} onNavigate={setCurrentView} />
      
      <main className="pt-24 pb-12 px-4 container mx-auto relative z-10 flex flex-col flex-1">
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

      <footer className="w-full py-8 text-center text-gray-600 text-[10px] md:text-xs uppercase tracking-[0.3em] z-10 mt-auto border-t border-white/5 bg-black/40 backdrop-blur-sm">
        &copy; 2026 Project X. All Rights Reserved.
      </footer>
    </div>
  );
}

export default App;