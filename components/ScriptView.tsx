import React, { useState } from 'react';
import { Copy, Check, Terminal, ChevronRight } from 'lucide-react';
import { Button } from './ui/Button';

interface ScriptViewProps {
  onNext: () => void;
}

export const ScriptView: React.FC<ScriptViewProps> = ({ onNext }) => {
  const [copiedKey, setCopiedKey] = useState(false);
  const [copiedScript, setCopiedScript] = useState(false);

  // Use environment variable if available, otherwise fallback to default
  const defaultKey = "KD-6af0f0b1-bad8-4e6e-940c-0f536a39eead";
  
  // Access Vite environment variable (must be prefixed with VITE_)
  // We use a safe check for import.meta.env
  const scriptKey = (import.meta as any).env?.VITE_SCRIPT_KEY || defaultKey;

  const loadScript = `loadstring(game:HttpGet("https://api.kodamo.net/loader/fxbpontv5v9fy82ycrd9"))()`;

  const fullScript = `script_key = "${scriptKey}"\n${loadScript}`;

  const handleCopy = (text: string, setCopied: (val: boolean) => void) => {
    navigator.clipboard.writeText(text);
    setCopied(true);
    setTimeout(() => setCopied(false), 2000);
  };

  return (
    <div className="flex flex-col items-center justify-center min-h-[80vh] px-4 w-full max-w-4xl mx-auto animate-in fade-in zoom-in-95 duration-500">
      
      <div className="text-center mb-12">
        <h2 className="text-4xl md:text-6xl font-bold mb-4 font-sans text-white drop-shadow-[0_0_10px_rgba(255,0,0,0.5)]">
          INITIALIZE
        </h2>
        <p className="text-gray-400 text-lg uppercase tracking-widest">
          Copy the script below and execute in your executor
        </p>
      </div>

      {/* Script Box */}
      <div className="w-full bg-black/80 border border-blood-500/30 rounded-lg overflow-hidden shadow-[0_0_30px_rgba(220,0,0,0.15)] relative group">
        
        {/* Header of code block */}
        <div className="flex items-center justify-between px-4 py-2 bg-zinc-900/90 border-b border-zinc-800">
          <div className="flex items-center gap-2">
            <Terminal className="w-4 h-4 text-blood-500" />
            <span className="text-xs text-gray-400 font-mono">project_x_loader.lua</span>
          </div>
          <div className="flex gap-2">
            <div className="w-3 h-3 rounded-full bg-yellow-500/20"></div>
            <div className="w-3 h-3 rounded-full bg-green-500/20"></div>
            <div className="w-3 h-3 rounded-full bg-red-500"></div>
          </div>
        </div>

        {/* Code Content */}
        <div className="p-6 font-mono text-xs md:text-sm lg:text-base relative bg-[#0a0a0a] overflow-x-auto scrollbar-hide">
          <div className="absolute top-0 left-0 w-full h-full bg-[url('https://www.transparenttextures.com/patterns/carbon-fibre.png')] opacity-5 pointer-events-none"></div>
          
          <div className="space-y-4 relative z-10 whitespace-normal md:whitespace-nowrap">
             {/* Key Variable */}
             <div className="group/line flex items-baseline gap-2">
                <div className="flex-1 break-all md:break-normal">
                   <span className="text-purple-400">script_key</span>
                   <span className="text-white mx-1.5">=</span>
                   <span className="text-green-400">"{scriptKey}"</span>
                </div>
                <button 
                  onClick={() => handleCopy(scriptKey, setCopiedKey)}
                  className="shrink-0 opacity-40 group-hover/line:opacity-100 transition-opacity flex items-center gap-1 text-[10px] text-gray-400 hover:text-white"
                >
                  {copiedKey ? <Check className="w-3 h-3 text-green-500"/> : <Copy className="w-3 h-3"/>}
                  {copiedKey ? 'Copied' : 'Key'}
                </button>
             </div>

             {/* Loadstring */}
             <div className="break-all md:break-normal">
                <span className="text-blue-400">loadstring</span>
                <span className="text-yellow-300">(</span>
                <span className="text-cyan-400">game</span>
                <span className="text-white">:</span>
                <span className="text-blue-300">HttpGet</span>
                <span className="text-yellow-300">(</span>
                <span className="text-green-400">"https://api.kodamo.net/loader/fxbpontv5v9fy82ycrd9"</span>
                <span className="text-yellow-300">))()</span>
             </div>
          </div>

          {/* Bottom Action */}
          <div className="mt-8 flex justify-end">
             <Button 
                variant="primary" 
                onClick={() => handleCopy(fullScript, setCopiedScript)}
                className="text-xs py-1.5 px-3 shadow-[0_0_15px_rgba(255,0,0,0.4)]"
             >
               {copiedScript ? (
                 <>
                   <Check className="w-3 h-3 mr-1.5" /> Copied All
                 </>
               ) : (
                 <>
                   <Copy className="w-3 h-3 mr-1.5" /> Copy Full Script
                 </>
               )}
             </Button>
          </div>
        </div>
      </div>

      <div className="mt-12">
        <Button onClick={onNext} variant="secondary" className="hover:border-blood-500 hover:text-blood-500" icon={ChevronRight}>
          Join Community
        </Button>
      </div>

    </div>
  );
};